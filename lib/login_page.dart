import 'package:flutter/material.dart';
import 'package:geotag/top_bar.dart';
import 'login_body.dart';
import 'navigation_button.dart';
import 'navigation_drawer.dart';

class LoginPage extends StatelessWidget {

  static const String routeName = '/login_page';
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
              TopBar('My Account', true),
              LoginBody()
            ],
          ),
          NavigationButton(_scaffoldKey)
        ],
      ),
    );
  }
}