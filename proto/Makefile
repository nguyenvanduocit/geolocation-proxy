injectTag:
	for fn in ./**/*.go; protoc-go-inject-tag -input=$fn; end
generate:
	protoc -I src/ src/geolocation-proxy.proto --go_out=plugins=grpc:./go --dart_out=grpc:./dart
