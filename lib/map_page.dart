import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'navigation_drawer.dart';
import 'map_speed_dial.dart';
import 'map_widget.dart';

class MapPage extends StatelessWidget {
  static const String routeName = '/map_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          MapWidget(),
          navigationButton(context)
        ],
      ),
      floatingActionButton: MapSpeedDial()
  );

  Widget navigationButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(right: 2.0, bottom: 20.0),
        child: RawMaterialButton(
          elevation: 18.0,
          fillColor: Theme.of(context).primaryColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(14.0),
          child: Icon(
              FeatherIcons.anchor,
              size: 28.0,
              color: Theme.of(context).buttonColor
          ),
          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
        ),
      );
  }
}