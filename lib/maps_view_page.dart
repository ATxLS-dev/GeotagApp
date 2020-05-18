import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'new_tag_overlay.dart';
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
      floatingActionButton: NewTagFloatingActionButton()
    );
}

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key:key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
              borderRadius: BorderRadius.all(radius)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(radius),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewTagFloatingActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      FloatingActionButton(
        foregroundColor: Colors.blue,
        child: Icon(FeatherIcons.crosshair, color: Colors.white),
        onPressed: () => {
          Navigator.of(context).push(NewTagOverlay())
        },
      );
}

//
//final _getCoordinates = BehaviorSubject<CoordinateSet>();
//Stream<Position> get positionStream => geolocator.getPositionStream(
//    LocationOptions(accuracy: LocationAccuracy.best));
//
//Get the current phone position as a stream
//StreamSubscription<Position> positionStream = geolocator.getPositionStream(
//LocationOptions(
//accuracy: LocationAccuracy.best
//)).listen(
//(Position position) => currentPositionMap = CoordinateSet(position.latitude, position.longitude));