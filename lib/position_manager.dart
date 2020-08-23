import 'package:geolocator/geolocator.dart';
import 'dart:async';

class PositionManager {

  PositionManager() {
    checkGeolocationPermissions();
  }

  final _geolocator = Geolocator()..forceAndroidLocationManager = true;
  var geolocationStatus = GeolocationStatus.unknown;

  void checkGeolocationPermissions() async {
    geolocationStatus = await _geolocator.checkGeolocationPermissionStatus();
  }
}

class PositionBloc extends PositionManager {

  Future<Position> getCurrentPosition() async {
    var currentPosition = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(currentPosition);
    return currentPosition;
  }

  StreamController streamListController = StreamController<Position>.broadcast();

  Sink get positionSink => streamListController.sink;

  Stream<Position> get positionStream => streamListController.stream;

  void sendCurrentPosition() async =>
    streamListController.add(await getCurrentPosition());
}