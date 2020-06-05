import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotag/config.dart';

class CreateTagFAB extends StatefulWidget {
  @override
  _CreateTagFABState createState() => _CreateTagFABState();
}

class _CreateTagFABState extends State<CreateTagFAB> {

  bool _savingLocation = false;
  bool _success = false;

  @override
  Widget build(BuildContext context) {
    return !_savingLocation
        ? FloatingActionButton(
          backgroundColor: Colors.blue,
          child: FaIcon(FontAwesomeIcons.crosshairs),
          onPressed: () async {
            setState(() {
              _savingLocation = true;
            });
            await positionManager.getCurrentPosition();
            await Future.delayed(Duration(milliseconds: 500));
            if (positionManager.currentPosition != null) {
              hiveDBManager.saveTag(currentPosition: positionManager.currentPosition);
            }
            setState(() {
              _success = true;
            });
            await Future.delayed(Duration(milliseconds: 500));
            },
          )
        : !_success
          ? CircularProgressIndicator() : FaIcon(FontAwesomeIcons.check);
  }
}

//import 'package:geolocator/geolocator.dart';

//class CreateTagFAB extends StatefulWidget {
//  final bool androidFusedLocation = true;
//  @override
//  _CreateTagFABState createState() => _CreateTagFABState();
//}
//
//class _CreateTagFABState extends State<CreateTagFAB> {
//  Position _currentPosition;
//
//  @override
//  void initState() {
//    super.initState();
//    _initCurrentLocation;
//  }
//
//  @override
//  void didUpdateWidget(Widget oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    setState(() {
//      _currentPosition = null;
//    });
//    _initCurrentLocation();
//  }
//
//  void _initCurrentLocation() {
//    Geolocator()
//      ..forceAndroidLocationManager = !widget.androidFusedLocation
//      ..getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//          .then((position) {
//        setState(() => _currentPosition = position);
//      });
//  }
//
//  bool _savingLocation = false;
//  bool _success = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return !_savingLocation
//        ? FloatingActionButton(
//            backgroundColor: Colors.blue,
//            child: FaIcon(FontAwesomeIcons.crosshairs),
//            onPressed: () async {
//              setState(() {
//                _savingLocation = true;
//              });
//              _initCurrentLocation();
//              await Future.delayed(Duration(milliseconds: 500));
//              if (_currentPosition != null) {
//                hiveDBManager.saveTag(currentPosition: _currentPosition);
//              }
//              setState(() {
//                _success = true;
//              });
//              await Future.delayed(Duration(milliseconds: 500));
//            },
//          )
//        : !_success
//            ? CircularProgressIndicator()
//            : FaIcon(FontAwesomeIcons.check);
//  }
//}
