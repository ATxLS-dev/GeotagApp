import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_tag_DB.dart';

class CurrentLocationFAB extends StatefulWidget {
  const CurrentLocationFAB({Key key, @required this.androidFusedLocation})
      : super(key: key);
  final bool androidFusedLocation;
  @override
  _CurrentLocationFABState createState() => _CurrentLocationFABState();
}

class _CurrentLocationFABState extends State<CurrentLocationFAB> {
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _initCurrentLocation;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _currentPosition = null;
    });
    _initCurrentLocation();
  }

  void _initCurrentLocation() {
    Geolocator()
      ..forceAndroidLocationManager = !widget.androidFusedLocation
      ..getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((position) {
        if (mounted) {
          setState(() => {_currentPosition = position});
        }
      }).catchError((e) {
        print(e);
      });
  }

  final _hiveDB = HiveDB();
  bool savingLocation = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return !savingLocation
        ? FloatingActionButton(
            backgroundColor: Colors.blue,
            child: FaIcon(FontAwesomeIcons.crosshairs),
            onPressed: () async {
              setState(() {
                savingLocation = true;
              });
              _hiveDB.saveTag(currentPosition: _currentPosition);
              await Future.delayed(Duration(milliseconds: 500));
              setState(() {
                success = true;
              });
              await Future.delayed(Duration(milliseconds: 500));
            },
          )
        : !success
            ? CircularProgressIndicator()
            : FaIcon(FontAwesomeIcons.check);
  }
}
