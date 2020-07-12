import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
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
  String _mapStyle;
  MapBloc mapBloc = MapBloc();

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_theme_burnt.txt')
        .then((string) => _mapStyle = string);
    mapBloc.streamCurrentPosition();
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
                : CircularProgressIndicator();
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
        },
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
          print('recenter map')
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
}