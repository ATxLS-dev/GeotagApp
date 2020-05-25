import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'navigation_drawer.dart';
import 'tag_creator_button.dart';

class MapViewPage extends StatelessWidget {
  static const String routeName = '/maps_view_page';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Map'),
      ),
      drawer: NavigationDrawer(),
      body: MapWidget(),
      floatingActionButton: CurrentLocationFAB(androidFusedLocation: true));
}

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  LatLng _currentLocation;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    var geolocator = Geolocator()..forceAndroidLocationManager;
    var _position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentLocation = LatLng(_position.latitude, _position.longitude);
  }

  final radius = Radius.circular(22.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(22.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.all(radius)),
          child: ClipRRect(
            borderRadius: BorderRadius.all(radius),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 11.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
