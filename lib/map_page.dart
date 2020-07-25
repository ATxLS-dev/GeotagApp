import 'package:flutter/material.dart';
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
          NavigationButton(_scaffoldKey)
        ],
      ),
  );
}