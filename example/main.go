package main

import (
	"context"
	"log"
	"time"

	grpczap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"google.golang.org/grpc/encoding/gzip"
	"google.golang.org/grpc/status"

	"geolocation-proxy/internal/geolocationproto"
)

func main() {
	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)

	logger, err := zap.NewDevelopment()
	if err != nil {
		log.Fatalln(err)
	}

	conn, err := grpc.DialContext(
		ctx,
		"127.0.0.1:8282",
		grpc.WithInsecure(),
		grpc.WithChainUnaryInterceptor(
			grpczap.UnaryClientInterceptor(logger),
		),
		grpc.WithChainStreamInterceptor(
			grpczap.StreamClientInterceptor(logger),
		),
	)
	if err != nil {
		logger.Fatal("", zap.Error(err))
	}
	defer conn.Close()

	client := geolocationproto.NewGeolocationProxyClient(conn)
	response, err := client.Geolocate(ctx, &geolocationproto.GeolocationRequest{
		HomeMobileCountryCode: 452,
		HomeMobileNetworkCode: 1,
		RadioType:             "GSM",
		Carrier:               "vinaphone",
		CellTowers: []*geolocationproto.CellTower{
			{
				CellId:            34641,
				LocationAreaCode:  20100,
				MobileCountryCode: 452,
				MobileNetworkCode: 1,
				SignalStrength:    -67,
			},
		},
	}, grpc.UseCompressor(gzip.Name))
	if err != nil {
		errStatus, _ := status.FromError(err)
		logger.Error(errStatus.Message(), zap.Reflect("err", errStatus))
	}

	logger.Info("response", zap.Reflect("response", response))
}
