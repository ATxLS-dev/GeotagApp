import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  LatLng _currentLocation;
  StreamSubscription<Position> _positionStreamSubscription;
  final _positions = <Position>[];
  final locationOptions = LocationOptions(accuracy: LocationAccuracy.best);

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator().getPositionStream(locationOptions);
      _positionStreamSubscription = positionStream.listen(
          (Position position) => setState(() => _positions.add(position)));
      _positionStreamSubscription.pause();
    }

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
      } else {
        _positionStreamSubscription.pause();
      }
    });
  }

  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    _toggleListening();
    _currentLocation =
        LatLng(_positions.last.latitude, _positions.last.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Geolocator().checkGeolocationPermissionStatus(),
      builder:
          (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == GeolocationStatus.denied) {
          return const Center(child: Text('location services disabled'));
        }
        return _mapWidget();
      },
    );
  }

  final _radius = Radius.circular(22.0);
  Widget _mapWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(22.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.all(_radius)),
          child: ClipRRect(
              borderRadius: BorderRadius.all(_radius),
              child: Stack(children: <Widget>[
                _mapView(),
                _returnToCurrentLocationButton()
              ])),
        ),
      ),
    );
  }

  //Wrap with stream builder?
  Widget _mapView() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: _currentLocation ?? LatLng(37.4219999, -122.0862462),
        zoom: 11.0,
      ),
    );
  }

  Widget _returnToCurrentLocationButton() {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: CupertinoButton(
            color: Colors.black45,
            child: Center(
                child: Icon(
              Icons.navigation,
              color: Colors.white,
            )),
            onPressed: _toggleListening),
      ),
    );
  }
}