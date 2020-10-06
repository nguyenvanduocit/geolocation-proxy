package main

import (
	"encoding/json"
	"errors"
	"flag"
	"io/ioutil"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"

	"geolocation-proxy/internal/geolocationproto"
	"geolocation-proxy/internal/serviceserver"
	"github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
	"github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	"github.com/takama/daemon"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"google.golang.org/grpc"
	_ "google.golang.org/grpc/encoding/gzip"
	"gopkg.in/natefinch/lumberjack.v2"
)

type Config struct {
	Addresses    []string `json:"addresses"`
	LogFile      string   `json:"log_file"`
	GoogleApiKey string   `json:"google_api_key"`
}

func loadConfig(configFile string) (*Config, error) {
	configContent, err := ioutil.ReadFile(configFile)
	if err != nil {
		return nil, err
	}
	var config Config

	if err := json.Unmarshal(configContent, &config); err != nil {
		return nil, err
	}
	return &config, nil
}

func main() {
	logger, err := zap.NewProduction()
	if err != nil {
		log.Fatalln(err)
	}
	defer logger.Sync()

	flag.Int("flagname", 1234, "help message for flagname")

	var configFile string
	var serviceCommand string
	flag.StringVar(&configFile, "config", "", "Absolute config file path")
	flag.StringVar(&serviceCommand, "service", "", "service command")
	flag.Parse()

	if serviceCommand != "" {
		status, err := handleService(serviceCommand, configFile)
		if err != nil && !errors.Is(err, daemon.ErrNotInstalled) {
			log.Panicln(err)
		}
		log.Println(status)
		return
	}

	if configFile == "" {
		log.Panicln(errors.New("config is required"))
	}

	config, err := loadConfig(configFile)
	if err != nil {
		log.Panicln(err)
	}

	w := zapcore.AddSync(&lumberjack.Logger{
		Filename:   config.LogFile,
		MaxSize:    10, // megabytes
		MaxBackups: 3,
		MaxAge:     30, // days
	})
	core := zapcore.NewCore(
		zapcore.NewJSONEncoder(zap.NewProductionEncoderConfig()),
		w,
		zap.DebugLevel,
	)
	logger = zap.New(core)

	grpcServer := grpc.NewServer(
		grpc.StreamInterceptor(grpc_middleware.ChainStreamServer(
			grpc_zap.StreamServerInterceptor(logger),
			grpc_recovery.StreamServerInterceptor(),
		)),
		grpc.UnaryInterceptor(grpc_middleware.ChainUnaryServer(
			grpc_zap.UnaryServerInterceptor(logger),
			grpc_recovery.UnaryServerInterceptor(),
		)),
	)

	serviceServer, err := serviceserver.NewServiceServer(logger, config.GoogleApiKey)
	if err != nil {
		logger.Fatal("failed to create service server", zap.Error(err))
	}
	geolocationproto.RegisterGeolocationProxyServer(grpcServer, serviceServer)

	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt, os.Kill, syscall.SIGTERM)

	var listen net.Listener
	for _, port := range config.Addresses {
		listen, err = net.Listen("tcp", port)
		if err == nil {
			break
		}
		logger.Error("port is in used", zap.Error(err))
	}

	if listen == nil {
		logger.Fatal("listen is nil")
	}

	logger.Info("started", zap.Int("pid", os.Getpid()), zap.Reflect("config", config), zap.String("address", listen.Addr().String()))

	go func(listen net.Listener, logger *zap.Logger) {
		if err := grpcServer.Serve(listen); err != nil {
			logger.Fatal("s.Serve error", zap.Error(err))
		}
	}(listen, logger)

	killSignal := <-interrupt
	logger.Info("Got signal:", zap.Any("killSignal", killSignal))
	return
}

func handleService(command string, configFile string) (string, error) {
	service, err := daemon.New("geolocation-proxy", "geolocation proxy that bridge client with server", daemon.SystemDaemon)
	if err != nil {
		return "error", err
	}
	switch command {
	case "install":
		if configFile == "" {
			return "error", errors.New("--config is required")
		}
		return service.Install("--config", configFile)
	case "remove":
		return service.Remove()
	case "start":
		return service.Start()
	case "stop":
		return service.Stop()
	case "status":
		return service.Status()
	case "restart":
		if _, err := service.Stop(); err != nil {
			log.Println("service.Stop()", zap.Error(err))
		}
		return service.Start()
	default:
		return "corerpc --service install | remove | start | stop | status | restart", nil
	}
}
