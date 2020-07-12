import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'dart:math' as math;
import 'navigation_drawer.dart';
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
  );

  Widget navigationButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(right: 2.0, bottom: 20.0),
      child: RawMaterialButton(
        elevation: 18.0,
        fillColor: Theme.of(context).buttonColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(14.0),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            FeatherIcons.sidebar,
            size: 28.0,
            color: Colors.white
          )
        ),
        onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
      ),
    );
  }
}