import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'navigation_drawer.dart';

class SettingsPage extends StatelessWidget {

  static const String routeName = '/settings_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final neumorphicStyle = NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.all(Radius.circular(15.0))
        ),
        depth: 4,
        intensity: 0.7,
        border: NeumorphicBorder(color: Colors.white.withOpacity(0.5), width: 1.0),
        color: Theme.of(context).scaffoldBackgroundColor
    );

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          Wrap(
            runSpacing: 10.0,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 46.0, 20.0, 0.0),
                child: Neumorphic(
                  style: neumorphicStyle,
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: NavigationButton(_scaffoldKey)
          ),
        ],
      ),
    );
  }
}