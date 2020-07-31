import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math' as math;

class NavigationButton extends StatelessWidget {

  NavigationButton(this._scaffoldKey);
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(bottom: 40.0),
      child: NeumorphicTheme(
        theme: NeumorphicThemeData(
          baseColor: Theme.of(context).buttonColor,
          lightSource: LightSource.topLeft,
        ),
        child: Neumorphic(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
          style: NeumorphicStyle(
              depth: -4.0,
              intensity: 1,
              color: Theme.of(context).scaffoldBackgroundColor,
              border: NeumorphicBorder(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2.8),
              boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.only(
                      topLeft: Radius.circular(37.0),
                      bottomLeft: Radius.circular(37.0))
              )
          ),
          child: NeumorphicButton(
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
                border: NeumorphicBorder(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2.8)
            ),
            padding: EdgeInsets.all(14.0),
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Icon(FeatherIcons.sidebar,
                    size: 28.0, color: Colors.white)
            ),
          ),
        ),
      ),
    );
  }
}