import 'package:geolocator/geolocator.dart';
import 'dart:async';

class PositionManager {

  PositionManager() {
    _checkGeolocationPermissions();
  }
  
  Position currentPosition;
  static final _geolocator = Geolocator();
  var geolocationStatus = GeolocationStatus.unknown;

  void _checkGeolocationPermissions() async {
    geolocationStatus = await _geolocator.checkGeolocationPermissionStatus();
  }

  Future<Position> getCurrentPosition() async {
    currentPosition = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return currentPosition;
  }

  Stream<Position> get positionStream => _geolocator.getPositionStream(LocationOptions(accuracy: LocationAccuracy.best));

  Position activePosition;
  StreamSubscription<Position> _positionStreamSubscription;
  void toggleListening() {
    if (_positionStreamSubscription == null) {
      _positionStreamSubscription = positionStream.listen((position) => activePosition = position);
      _positionStreamSubscription.pause();
    }
    if (_positionStreamSubscription.isPaused) {
      _positionStreamSubscription.resume();
    } else {
      _positionStreamSubscription.pause();
    }
  }
}
