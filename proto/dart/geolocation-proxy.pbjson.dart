///
//  Generated code. Do not modify.
//  source: geolocation-proxy.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const CellTower$json = const {
  '1': 'CellTower',
  '2': const [
    const {'1': 'cell_id', '3': 1, '4': 1, '5': 5, '10': 'cellId'},
    const {'1': 'location_area_code', '3': 2, '4': 1, '5': 5, '10': 'locationAreaCode'},
    const {'1': 'mobile_country_code', '3': 3, '4': 1, '5': 5, '10': 'mobileCountryCode'},
    const {'1': 'mobile_network_code', '3': 4, '4': 1, '5': 5, '10': 'mobileNetworkCode'},
    const {'1': 'signal_strength', '3': 5, '4': 1, '5': 5, '10': 'signalStrength'},
  ],
};

const WifiAccessPoint$json = const {
  '1': 'WifiAccessPoint',
  '2': const [
    const {'1': 'mac_address', '3': 1, '4': 1, '5': 9, '10': 'macAddress'},
    const {'1': 'signal_strength', '3': 2, '4': 1, '5': 1, '10': 'signalStrength'},
    const {'1': 'channel', '3': 3, '4': 1, '5': 5, '10': 'channel'},
    const {'1': 'signal_to_noise_ratio', '3': 4, '4': 1, '5': 1, '10': 'signalToNoiseRatio'},
  ],
};

const GeolocationRequest$json = const {
  '1': 'GeolocationRequest',
  '2': const [
    const {'1': 'home_mobile_country_code', '3': 1, '4': 1, '5': 5, '10': 'homeMobileCountryCode'},
    const {'1': 'home_mobile_network_code', '3': 2, '4': 1, '5': 5, '10': 'homeMobileNetworkCode'},
    const {'1': 'radio_type', '3': 3, '4': 1, '5': 9, '10': 'radioType'},
    const {'1': 'carrier', '3': 4, '4': 1, '5': 9, '10': 'carrier'},
    const {'1': 'cellTowers', '3': 5, '4': 3, '5': 11, '6': '.geolocationproto.CellTower', '10': 'cellTowers'},
    const {'1': 'wifiAccessPoints', '3': 6, '4': 3, '5': 11, '6': '.geolocationproto.WifiAccessPoint', '10': 'wifiAccessPoints'},
  ],
};

const Location$json = const {
  '1': 'Location',
  '2': const [
    const {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    const {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
  ],
};

const GeolocationResponse$json = const {
  '1': 'GeolocationResponse',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 11, '6': '.geolocationproto.Location', '10': 'location'},
    const {'1': 'accuracy', '3': 2, '4': 1, '5': 1, '10': 'accuracy'},
  ],
};

