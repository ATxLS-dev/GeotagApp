import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'map_body.dart';
import 'navigation_button.dart';

class MapPage extends StatelessWidget {
  static const String routeName = '/map_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(pageIndex),
      body: Stack(
        children: <Widget>[
          MapBody(),
          NavigationButton(_scaffoldKey)
        ],
      ),
  );
}