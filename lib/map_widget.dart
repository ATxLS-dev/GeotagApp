import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'position_manager.dart';
import 'config.dart';

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
    rootBundle.loadString('assets/map_theme_burnt.txt')
        .then((string) => _mapStyle = string);
    mapBloc.streamCurrentPosition();
    BitmapDescriptor
        .fromAssetImage(ImageConfiguration(
            devicePixelRatio: 2.5), 'assets/tag_markers/tag.png')
      .then((value) => pinIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder(
          stream: mapBloc.positionStream,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            return snapshot.hasData ?
              _mapView(LatLng(snapshot.data.latitude, snapshot.data.longitude))
                : _buildIndeterminateProgress();
            },
        ),
        speedDial(context)
      ]
    );
  }

  Widget _mapView(LatLng _latLngSnapshot) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller.setMapStyle(_mapStyle);
        setState(() {
          markers.add(
              Marker(
                  markerId: MarkerId('<MARKER_ID>'),
                  position: _latLngSnapshot,
                  icon: pinIcon
              ));
        });
        },
      markers: markers,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
          target: _latLngSnapshot,
          zoom: 11.0
      ),
    );
  }

  Widget speedDial(BuildContext context) {
    return Align(
      child: SpeedDial(
        marginBottom: 102.0,
        marginRight: 32.0,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        visible: true,
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Theme.of(context).buttonColor,
        foregroundColor: Colors.white,
        children: [
          _createTag(),
          _centerMap(),
          _enableTagView()
        ],
      ),
    );
  }

  SpeedDialChild _createTag() {
    return SpeedDialChild(
      backgroundColor: Theme.of(context).buttonColor,
      child: Icon(FeatherIcons.anchor, color: Colors.white),
      onTap: () async {
        await mapBloc.streamCurrentPosition();
        if (mapBloc.currentPosition != null) {
          tagDatabase.saveTag(currentPosition: mapBloc.currentPosition);
        }},
    );
  }

  SpeedDialChild _centerMap() {
    return SpeedDialChild(
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(FeatherIcons.moon, color: Colors.white),
        onTap: () => {
          mapBloc.streamCurrentPosition(),
        }
    );
  }

  SpeedDialChild _enableTagView() {
    return SpeedDialChild(
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(FeatherIcons.mapPin, color: Colors.white),
        onTap: () => print('THIRD CHILD')
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
                height: 10,
              ),
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}