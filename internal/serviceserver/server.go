package serviceserver

import (
	"context"

	"go.uber.org/zap"
	"googlemaps.github.io/maps"

	"geolocation-proxy/internal/geolocationproto"
)

type ServiceServer struct {
	Logger    *zap.Logger
	MapClient *maps.Client
}

func NewServiceServer(logger *zap.Logger, apiKey string) (s *ServiceServer, err error) {
	s = &ServiceServer{
		Logger: logger,
	}

	s.MapClient, err = maps.NewClient(maps.WithAPIKey(apiKey))
	if err != nil {
		return nil, err
	}

	return s, nil
}

func (s *ServiceServer) Geolocate(ctx context.Context, request *geolocationproto.GeolocationRequest) (*geolocationproto.GeolocationResponse, error) {
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

	response, err := s.MapClient.Geolocate(ctx, geolocationRequest)
	if err != nil {
		return nil, err
	}

	return &geolocationproto.GeolocationResponse{
		Location: &geolocationproto.Location{
			Lat: response.Location.Lat,
			Lng: response.Location.Lng,
		},
		Accuracy: response.Accuracy,
	}, nil
}
