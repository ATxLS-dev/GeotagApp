import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_db_manager.dart';

class CreateTagFAB extends StatefulWidget {
  const CreateTagFAB({Key key, @required this.androidFusedLocation})
      : super(key: key);
  final bool androidFusedLocation;
  @override
  _CreateTagFABState createState() => _CreateTagFABState();
}

class _CreateTagFABState extends State<CreateTagFAB> {
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

  final _hiveDB = HiveDBManager();
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
              _initCurrentLocation();
              await Future.delayed(Duration(milliseconds: 500));
              if (_currentPosition != null) {
                _hiveDB.saveTag(currentPosition: _currentPosition);
              }
              setState(() {
                _success = true;
              });
              await Future.delayed(Duration(milliseconds: 500));
            },
          )
        : !_success
            ? CircularProgressIndicator()
            : FaIcon(FontAwesomeIcons.check);
  }
}
