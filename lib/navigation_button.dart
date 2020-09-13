import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math' as math;
import 'neumorphic_styles.dart';

class NavigationButton extends StatelessWidget {

  NavigationButton(this._scaffoldKey);
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final neumorphicStyles = NeumorphicStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(bottom: 40.0),
      child: NeumorphicTheme(
        theme: neumorphicStyles.baseTheme(),
        child: Neumorphic(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
          style: neumorphicStyles.sunkenArch(radius: 37.0, fromLeft: false),
          child: NeumorphicButton(
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            style: neumorphicStyles.raisedCircle(),
            padding: EdgeInsets.all(14.0),
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: neumorphicStyles.iconStyle(FeatherIcons.sidebar)
            ),
          ),
        ),
      ),
    );
  }
}