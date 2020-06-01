import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationManager {
  Position position;
  GeolocationStatus geolocationStatus;

  var geolocator = Geolocator();

  void initGeolocation() async {
    geolocator..forceAndroidLocationManager = true;
    geolocationStatus = await geolocator.checkGeolocationPermissionStatus();
  }

  Future<Position> getCurrentPosition() async {
    position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }
}
