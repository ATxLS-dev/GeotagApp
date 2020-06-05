import 'dart:async';
import 'package:geolocator/geolocator.dart';

class PositionManager {
  
  PositionManager() {
    _initGeolocation();
  }
  
  Position currentPosition;
  GeolocationStatus _geolocationStatus;
  final _geolocator = Geolocator();
  bool locationServicesEnabled = false;

  void _initGeolocation() async {
    _geolocator..forceAndroidLocationManager = true;
    _geolocationStatus = await _geolocator.checkGeolocationPermissionStatus();
    if (_geolocationStatus == GeolocationStatus.granted) {
      locationServicesEnabled = true;
    }
  }

  Future<Position> getCurrentPosition() async {
    currentPosition = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return currentPosition;
  }
  
  StreamSubscription<Position> _positionStreamSubscription;
  Position activePosition;

  void toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = _geolocator.getPositionStream(
          LocationOptions(accuracy: LocationAccuracy.best));
      _positionStreamSubscription = positionStream.listen(
              (position) => activePosition = position);
      _positionStreamSubscription.pause();
    }
    if (_positionStreamSubscription.isPaused) {
      _positionStreamSubscription.resume();
    } else {
      _positionStreamSubscription.pause();
    }
  }
}
