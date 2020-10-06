package serviceserver

import (
	"context"
	"strconv"
	"time"

	"github.com/allegro/bigcache"
	"github.com/golang/protobuf/proto"
	"go.uber.org/zap"
	"googlemaps.github.io/maps"

	"geolocation-proxy/internal/geolocationproto"
)

type ServiceServer struct {
	Logger    *zap.Logger
	MapClient *maps.Client
	Cache     *bigcache.BigCache
}

func NewServiceServer(logger *zap.Logger, apiKey string) (s *ServiceServer, err error) {
	s = &ServiceServer{
		Logger: logger,
	}

	s.MapClient, err = maps.NewClient(maps.WithAPIKey(apiKey))
	if err != nil {
		return nil, err
	}

	config := bigcache.Config{
		// number of shards (must be a power of 2)
		Shards: 1024,

		// time after which entry can be evicted
		LifeWindow: 12 * time.Hour,

		// Interval between removing expired entries (clean up).
		// If set to <= 0 then no action is performed.
		// Setting to < 1 second is counterproductive — bigcache has a one second resolution.
		CleanWindow: 5 * time.Minute,

		// rps * lifeWindow, used only in initial memory allocation
		MaxEntriesInWindow: 1000 * 10 * 60,

		// max entry size in bytes, used only in initial memory allocation
		MaxEntrySize: 1000,

		// prints information about additional memory allocation
		Verbose: true,

		// cache will not allocate more memory than this limit, value in MB
		// if value is reached then the oldest entries can be overridden for the new ones
		// 0 value means no size limit
		HardMaxCacheSize: 1024,
	}

	cache, initErr := bigcache.NewBigCache(config)
	if initErr != nil {
		return nil, initErr
	}
	s.Cache = cache
	return s, nil
}

func (s *ServiceServer) Geolocate(ctx context.Context, request *geolocationproto.GeolocationRequest) (*geolocationproto.GeolocationResponse, error) {

	cacheKey := strconv.FormatInt(int64(request.CellTowers[0].CellId), 10) + strconv.FormatInt(int64(request.CellTowers[0].LocationAreaCode), 10)

	if entry, err := s.Cache.Get(cacheKey); err == nil {
		s.Logger.Info("cache hit", zap.Int("cache len", s.Cache.Len()))
		var response geolocationproto.GeolocationResponse
		if err := proto.Unmarshal(entry, &response); err != nil {
			s.Logger.Error("failed to proto.Unmarshal", zap.Error(err))
		}
		return &response, nil
	}

	geolocationRequest := &maps.GeolocationRequest{
		HomeMobileCountryCode: int(request.HomeMobileCountryCode),
		HomeMobileNetworkCode: int(request.HomeMobileCountryCode),
		RadioType:             maps.RadioType(request.RadioType),
		Carrier:               request.Carrier,
		ConsiderIP:            false,
	}

	if len(request.CellTowers) > 0 {
		var cellTowers []maps.CellTower
		for _, cellTower := range request.CellTowers {
			cellTowers = append(cellTowers, maps.CellTower{
				CellID:            int(cellTower.CellId),
				LocationAreaCode:  int(cellTower.LocationAreaCode),
				MobileCountryCode: int(cellTower.MobileCountryCode),
				MobileNetworkCode: int(cellTower.MobileNetworkCode),
				SignalStrength:    int(cellTower.SignalStrength),
			})
		}
		geolocationRequest.CellTowers = cellTowers
	}

	if len(request.WifiAccessPoints) > 0 {
		var wiFiAccessPoints []maps.WiFiAccessPoint
		for _, wiFiAccessPoint := range request.WifiAccessPoints {
			wiFiAccessPoints = append(wiFiAccessPoints, maps.WiFiAccessPoint{
				MACAddress:         wiFiAccessPoint.MacAddress,
				SignalStrength:     wiFiAccessPoint.SignalStrength,
				Channel:            int(wiFiAccessPoint.Channel),
				SignalToNoiseRatio: wiFiAccessPoint.SignalToNoiseRatio,
			})
		}
		geolocationRequest.WiFiAccessPoints = wiFiAccessPoints
	}

	geolocateResponse, err := s.MapClient.Geolocate(ctx, geolocationRequest)
	if err != nil {
		return nil, err
	}

	response := geolocationproto.GeolocationResponse{
		Location: &geolocationproto.Location{
			Lat: geolocateResponse.Location.Lat,
			Lng: geolocateResponse.Location.Lng,
		},
		Accuracy: geolocateResponse.Accuracy,
	}

	cacheContent, err := proto.Marshal(&response)
	if err := s.Cache.Set(cacheKey, cacheContent); err != nil {
		s.Logger.Error("failed to set cache", zap.Error(err))
	}

	return &response, nil
}
