import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotag/tag_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'position_manager.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'default_neumorphic_style.dart';

enum MapButton { recenter , toggleMarkers , createTag }

class MapBody extends StatefulWidget {
  MapBody({Key key}) : super(key: key);
  @override
  _MapBodyState createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {

  GoogleMapController _controller;
  final mapBloc = PositionBloc();
  final tagDatabase = TagDatabase();

  String _mapStyle;
  BitmapDescriptor pinIcon;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/map_theme_burnt.txt')
        .then((string) => _mapStyle = string);
    mapBloc.sendCurrentPosition();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/tag_markers/tag.png')
        .then((value) => pinIcon = value);
  }

  //Map does not rebuild when device location adjusts

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      StreamBuilder(
        stream: mapBloc.positionStream,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          return snapshot.hasData ?
            _mapView(LatLng(snapshot.data.latitude, snapshot.data.longitude))
              : _buildIndeterminateProgress();
        },
      ),
      mapButtons(context)
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
          CameraPosition(target: _latLngSnapshot, zoom: 11.0)
    );
  }

  Widget _buildIndeterminateProgress() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 47.0, right: 112.0, bottom: 55.0),
        child: NeumorphicProgressIndeterminate(height: 10),
      ),
    );
  }

  Widget mapButtons(BuildContext context) {
    final _runSpacing = 14.0;
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: 64.0),
      child: Column(
        children: <Widget>[
          _neumorphicMapButton(
              FeatherIcons.crosshair,
              MapButton.recenter),
          SizedBox(height: _runSpacing),
          _neumorphicMapButton(
              FeatherIcons.anchor,
              MapButton.toggleMarkers),
          SizedBox(height: _runSpacing),
          _neumorphicMapButton(
              FeatherIcons.plus,
              MapButton.createTag),
        ],
      ),
    );
  }

  Widget _neumorphicMapButton(IconData iconData, MapButton mapButton) {
    return Neumorphic(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      style: sunkenNeumorphicStyle(radius: 30.0, fromLeft: false),
      child: NeumorphicTheme(
        theme: defaultNeumorphicThemeData(),
        child: NeumorphicButton(
          onPressed: () => _buttonFunction(mapButton),
          style: raisedNeumorphicStyle(),
          padding: EdgeInsets.all(8.0),
          child: Icon(iconData, color: Colors.white, size: 24.0),
        ),
      ),
    );
  }

  void _buttonFunction(MapButton mapButton) async {
    switch (mapButton) {
      case MapButton.recenter:
        mapBloc.sendCurrentPosition();
        break;
      case MapButton.toggleMarkers:
        print('SECOND CHILD');
        break;
      case MapButton.createTag:
        var _currentPosition = await mapBloc.getCurrentPosition();
        if (_currentPosition != null) {
          tagDatabase.saveTag(currentPosition: _currentPosition);
        }
        break;
    }
  }
}