///
//  Generated code. Do not modify.
//  source: geolocation-proxy.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'geolocation-proxy.pb.dart' as $0;
export 'geolocation-proxy.pb.dart';

class GeolocationProxyClient extends $grpc.Client {
  static final _$geolocate =
      $grpc.ClientMethod<$0.GeolocationRequest, $0.GeolocationResponse>(
          '/geolocationproto.GeolocationProxy/Geolocate',
          ($0.GeolocationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GeolocationResponse.fromBuffer(value));

  GeolocationProxyClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GeolocationResponse> geolocate(
      $0.GeolocationRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$geolocate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GeolocationProxyServiceBase extends $grpc.Service {
  $core.String get $name => 'geolocationproto.GeolocationProxy';

  GeolocationProxyServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GeolocationRequest, $0.GeolocationResponse>(
            'Geolocate',
            geolocate_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GeolocationRequest.fromBuffer(value),
            ($0.GeolocationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GeolocationResponse> geolocate_Pre($grpc.ServiceCall call,
      $async.Future<$0.GeolocationRequest> request) async {
    return geolocate(call, await request);
  }

  $async.Future<$0.GeolocationResponse> geolocate(
      $grpc.ServiceCall call, $0.GeolocationRequest request);
}
