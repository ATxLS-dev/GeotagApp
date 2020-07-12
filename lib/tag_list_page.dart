import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math' as math;
import 'tag_list_widget.dart';
import 'navigation_drawer.dart';

class TagListPage extends StatelessWidget {
  static const String routeName = '/tag_list_page';
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
                    child: Container(
                      padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                'My Tags',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontFamily: 'sficonsets',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container()
                          ),
                          Align(
                            alignment: Alignment.topRight,
                              child: SizedBox(
                                height: 30.0,
                                width: 60.0,
                                child: Neumorphic(
                                  style: neumorphicStyle,
                                  child: Icon(FeatherIcons.arrowUpLeft),
                                ),
                              )
                            )
                        ],
                      ),
                    ),
                  ),
              ),
              TagListWidget(),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: navigationButton(context)
          ),
        ],
      ),
    );
  }

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