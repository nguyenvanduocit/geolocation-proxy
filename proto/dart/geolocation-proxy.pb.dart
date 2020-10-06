///
//  Generated code. Do not modify.
//  source: geolocation-proxy.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CellTower extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CellTower', package: const $pb.PackageName('geolocationproto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'cellId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'locationAreaCode', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'mobileCountryCode', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'mobileNetworkCode', $pb.PbFieldType.O3)
    ..a<$core.int>(5, 'signalStrength', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CellTower._() : super();
  factory CellTower() => create();
  factory CellTower.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CellTower.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CellTower clone() => CellTower()..mergeFromMessage(this);
  CellTower copyWith(void Function(CellTower) updates) => super.copyWith((message) => updates(message as CellTower));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CellTower create() => CellTower._();
  CellTower createEmptyInstance() => create();
  static $pb.PbList<CellTower> createRepeated() => $pb.PbList<CellTower>();
  @$core.pragma('dart2js:noInline')
  static CellTower getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CellTower>(create);
  static CellTower _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cellId => $_getIZ(0);
  @$pb.TagNumber(1)
  set cellId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCellId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCellId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get locationAreaCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set locationAreaCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocationAreaCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationAreaCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get mobileCountryCode => $_getIZ(2);
  @$pb.TagNumber(3)
  set mobileCountryCode($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMobileCountryCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobileCountryCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get mobileNetworkCode => $_getIZ(3);
  @$pb.TagNumber(4)
  set mobileNetworkCode($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMobileNetworkCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMobileNetworkCode() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get signalStrength => $_getIZ(4);
  @$pb.TagNumber(5)
  set signalStrength($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignalStrength() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignalStrength() => clearField(5);
}

class WifiAccessPoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WifiAccessPoint', package: const $pb.PackageName('geolocationproto'), createEmptyInstance: create)
    ..aOS(1, 'macAddress')
    ..a<$core.double>(2, 'signalStrength', $pb.PbFieldType.OD)
    ..a<$core.int>(3, 'channel', $pb.PbFieldType.O3)
    ..a<$core.double>(4, 'signalToNoiseRatio', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  WifiAccessPoint._() : super();
  factory WifiAccessPoint() => create();
  factory WifiAccessPoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WifiAccessPoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WifiAccessPoint clone() => WifiAccessPoint()..mergeFromMessage(this);
  WifiAccessPoint copyWith(void Function(WifiAccessPoint) updates) => super.copyWith((message) => updates(message as WifiAccessPoint));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WifiAccessPoint create() => WifiAccessPoint._();
  WifiAccessPoint createEmptyInstance() => create();
  static $pb.PbList<WifiAccessPoint> createRepeated() => $pb.PbList<WifiAccessPoint>();
  @$core.pragma('dart2js:noInline')
  static WifiAccessPoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WifiAccessPoint>(create);
  static WifiAccessPoint _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get macAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set macAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMacAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearMacAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get signalStrength => $_getN(1);
  @$pb.TagNumber(2)
  set signalStrength($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignalStrength() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignalStrength() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get channel => $_getIZ(2);
  @$pb.TagNumber(3)
  set channel($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannel() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get signalToNoiseRatio => $_getN(3);
  @$pb.TagNumber(4)
  set signalToNoiseRatio($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignalToNoiseRatio() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignalToNoiseRatio() => clearField(4);
}

class GeolocationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeolocationRequest', package: const $pb.PackageName('geolocationproto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'homeMobileCountryCode', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'homeMobileNetworkCode', $pb.PbFieldType.O3)
    ..aOS(3, 'radioType')
    ..aOS(4, 'carrier')
    ..pc<CellTower>(5, 'cellTowers', $pb.PbFieldType.PM, protoName: 'cellTowers', subBuilder: CellTower.create)
    ..pc<WifiAccessPoint>(6, 'wifiAccessPoints', $pb.PbFieldType.PM, protoName: 'wifiAccessPoints', subBuilder: WifiAccessPoint.create)
    ..hasRequiredFields = false
  ;

  GeolocationRequest._() : super();
  factory GeolocationRequest() => create();
  factory GeolocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeolocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeolocationRequest clone() => GeolocationRequest()..mergeFromMessage(this);
  GeolocationRequest copyWith(void Function(GeolocationRequest) updates) => super.copyWith((message) => updates(message as GeolocationRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeolocationRequest create() => GeolocationRequest._();
  GeolocationRequest createEmptyInstance() => create();
  static $pb.PbList<GeolocationRequest> createRepeated() => $pb.PbList<GeolocationRequest>();
  @$core.pragma('dart2js:noInline')
  static GeolocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeolocationRequest>(create);
  static GeolocationRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get homeMobileCountryCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set homeMobileCountryCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHomeMobileCountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearHomeMobileCountryCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get homeMobileNetworkCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set homeMobileNetworkCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHomeMobileNetworkCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearHomeMobileNetworkCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get radioType => $_getSZ(2);
  @$pb.TagNumber(3)
  set radioType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRadioType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRadioType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get carrier => $_getSZ(3);
  @$pb.TagNumber(4)
  set carrier($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCarrier() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarrier() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<CellTower> get cellTowers => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<WifiAccessPoint> get wifiAccessPoints => $_getList(5);
}

class Location extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Location', package: const $pb.PackageName('geolocationproto'), createEmptyInstance: create)
    ..a<$core.double>(1, 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'lng', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Location._() : super();
  factory Location() => create();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Location clone() => Location()..mergeFromMessage(this);
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get lng => $_getN(1);
  @$pb.TagNumber(2)
  set lng($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLng() => clearField(2);
}

class GeolocationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeolocationResponse', package: const $pb.PackageName('geolocationproto'), createEmptyInstance: create)
    ..aOM<Location>(1, 'location', subBuilder: Location.create)
    ..a<$core.double>(2, 'accuracy', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GeolocationResponse._() : super();
  factory GeolocationResponse() => create();
  factory GeolocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeolocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeolocationResponse clone() => GeolocationResponse()..mergeFromMessage(this);
  GeolocationResponse copyWith(void Function(GeolocationResponse) updates) => super.copyWith((message) => updates(message as GeolocationResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeolocationResponse create() => GeolocationResponse._();
  GeolocationResponse createEmptyInstance() => create();
  static $pb.PbList<GeolocationResponse> createRepeated() => $pb.PbList<GeolocationResponse>();
  @$core.pragma('dart2js:noInline')
  static GeolocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeolocationResponse>(create);
  static GeolocationResponse _defaultInstance;

  @$pb.TagNumber(1)
  Location get location => $_getN(0);
  @$pb.TagNumber(1)
  set location(Location v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
  @$pb.TagNumber(1)
  Location ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get accuracy => $_getN(1);
  @$pb.TagNumber(2)
  set accuracy($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccuracy() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccuracy() => clearField(2);
}

