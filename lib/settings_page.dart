import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geotag/top_bar.dart';
import 'navigation_drawer.dart';
import 'navigation_button.dart';

class SettingsPage extends StatelessWidget {

  static const String routeName = '/settings_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          Wrap(
            runSpacing: 10.0,
            children: <Widget>[
              TopBar('Settings', false)
              //Settings body
            ],
          ),
        NavigationButton(_scaffoldKey)
        ],
      )
    );
  }
}