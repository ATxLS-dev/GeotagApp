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

  Future<Position> syncCurrentPosition() async {
    currentPosition = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return currentPosition;
  }
}

class PositionBloc extends PositionManager {

  StreamController streamListController = StreamController<Position>.broadcast();

  Sink get positionSink => streamListController.sink;

  Stream<Position> get positionStream => streamListController.stream;

  void streamCurrentPosition() async =>
    positionSink.add(await syncCurrentPosition());
}