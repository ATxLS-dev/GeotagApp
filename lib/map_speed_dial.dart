import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'config.dart';

class MapSpeedDial extends StatefulWidget {
  @override
  _MapSpeedDialState createState() => _MapSpeedDialState();
}

class _MapSpeedDialState extends State<MapSpeedDial> {
  bool dialVisible = true;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      marginBottom: 90.0,
      animatedIcon: AnimatedIcons.list_view,
      animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      visible: dialVisible,
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Theme.of(context).buttonColor,
//      child: Icon whatever,
      children: [
        _createTag(),
        _centerMap(),
        _enableTagView()
      ],
    );
  }

  SpeedDialChild _createTag() {
    return SpeedDialChild(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(FeatherIcons.triangle, color: Theme.of(context).buttonColor),
      onTap: () async {
        await positionManager.getCurrentPosition();
        if (positionManager.currentPosition != null) {
          hiveDBManager.saveTag(currentPosition: positionManager.currentPosition);
        }
        },
    );
  }

  SpeedDialChild _centerMap() {
    return SpeedDialChild(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(FeatherIcons.moon, color: Theme.of(context).buttonColor),
      onTap: () => print('SECOND CHILD')
    );
  }

  SpeedDialChild _enableTagView() {
    return SpeedDialChild(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(FeatherIcons.mapPin, color: Theme.of(context).buttonColor),
        onTap: () => print('THIRD CHILD')
    );
  }
}
