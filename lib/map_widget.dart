import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'position_manager.dart';
import 'map_buttons.dart';

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController _controller;
  PositionBloc mapBloc = PositionBloc();

  String _mapStyle;
  BitmapDescriptor pinIcon;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/map_theme_burnt.txt')
        .then((string) => _mapStyle = string);
    mapBloc.streamCurrentPosition();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/tag_markers/tag.png')
        .then((value) => pinIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      StreamBuilder(
        stream: mapBloc.positionStream,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          return snapshot.hasData
              ? _mapView(
                  LatLng(snapshot.data.latitude, snapshot.data.longitude))
              : _buildIndeterminateProgress();
        },
      ),
      MapButtons()
    ]);
  }

  Widget _mapView(LatLng _latLngSnapshot) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller.setMapStyle(_mapStyle);
        setState(() => markers.add(Marker(
            markerId: MarkerId('<MARKER_ID>'),
            position: _latLngSnapshot,
            icon: pinIcon)));
      },
      markers: markers,
      myLocationButtonEnabled: false,
      initialCameraPosition:
          CameraPosition(target: _latLngSnapshot, zoom: 11.0),
    );
  }

  Widget _buildIndeterminateProgress() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 100.0, bottom: 55.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 12),
            Flexible(
              child: NeumorphicProgressIndeterminate(
                height: 10
              ),
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}