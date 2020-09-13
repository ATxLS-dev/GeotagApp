import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

class PositionManager {

  PositionManager() {
    _checkGeolocationPermissions();
  }

  final coordinateBox = Hive.box<double>('coordinateBox');
  LocationPermission locationPermission;

  void _checkGeolocationPermissions() async {
    locationPermission = await checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await requestPermission();
    }
  }

  void syncPosition() async {
    var currentPosition = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(currentPosition);
    await coordinateBox.put('latitude', currentPosition.latitude);
    await coordinateBox.put('longitude', currentPosition.longitude);
  }
}

// class PositionBloc extends PositionManager {
//
//   StreamController streamListController = StreamController<Position>.broadcast();
//
//   Sink get positionSink => streamListController.sink;
//
//   Stream<Position> get positionStream => streamListController.stream;
//
//   void sendCurrentPosition() async =>
//     streamListController.add(await getCurrentPosition(desiredAccuracy: LocationAccuracy.best));
// }