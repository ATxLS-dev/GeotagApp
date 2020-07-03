import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'config.dart';

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController _controller;
  String _mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_theme_burnt.txt')
        .then((string) => _mapStyle = string);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: positionManager.positionStream,
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        return _mapView(LatLng(snapshot.data.latitude, snapshot.data.longitude));
      },
    );
  }

  Widget _mapView(LatLng _latLngSnapshot) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller.setMapStyle(_mapStyle);
        },
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
          target: _latLngSnapshot ?? LatLng(37.4219999, -122.0862462),
          zoom: 11.0
      ),
    );
  }
}