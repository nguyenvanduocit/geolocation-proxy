package server

import (
	"context"

	"go.uber.org/zap"
	"googlemaps.github.io/maps"

	"geolocation-proxy/internal/geolocationproto"
)

type Server struct {
	Logger    *zap.Logger
	MapClient *maps.Client
}

func NewServer(logger *zap.Logger, apiKey string) (s *Server, err error) {
	s = &Server{
		Logger: logger,
	}

	s.MapClient, err = maps.NewClient(maps.WithAPIKey(apiKey))
	if err != nil {
		return nil, err
	}

	return s, nil
}

func (s *Server) Geolocate(context.Context, *geolocationproto.GeolocationRequest) (*geolocationproto.GeolocationResponse, error) {

	return &geolocationproto.GeolocationResponse{
		Location: &geolocationproto.Location{
			Lat: 0,
			Lng: 0,
		},
		Accuracy: 0,
	}, nil
}
