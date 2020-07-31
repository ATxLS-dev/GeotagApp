import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'position_manager.dart';
import 'config.dart';

class MapButtons extends StatelessWidget {

  static final _cornerRadius = Radius.circular(30.0);
  static final _runSpacing = 14.0;
  final mapBloc = PositionBloc();

  NeumorphicStyle _neumorphicStyle({double depth, NeumorphicBoxShape boxShape, Color color}) {
    return NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: boxShape,
        depth: depth,
        intensity: 1,
        border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8),
        color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: 64.0),
      child: Column(
        children: <Widget>[
          sortButton(
              FeatherIcons.crosshair,
                  () => mapBloc.streamCurrentPosition()),
          SizedBox(height: _runSpacing),
          sortButton(
              FeatherIcons.anchor,
                  () => print('THIRD CHILD')),
          SizedBox(height: _runSpacing),
          sortButton(
              FeatherIcons.plus,
                  () async {await mapBloc.streamCurrentPosition();
                    if (mapBloc.currentPosition != null) {
                      tagDatabase.saveTag(currentPosition: mapBloc.currentPosition);
                    }}),
        ],
      ),
    );
  }

  Widget sortButton(IconData iconData, VoidCallback onPressed) {
    return Neumorphic(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      style: _neumorphicStyle(
          depth: -4.0,
          color: Color(0xffF8F4EC),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
              topLeft: _cornerRadius, bottomLeft: _cornerRadius))),
      child: NeumorphicTheme(
        theme: NeumorphicThemeData(
          baseColor: NeumorphicColors.background,
          lightSource: LightSource.topLeft,
        ),
        child: NeumorphicButton(
          onPressed: onPressed,
          style: _neumorphicStyle(
              depth: 4.0,
              boxShape: NeumorphicBoxShape.circle(),
              color: Color(0xff2E2C24)),
          padding: EdgeInsets.all(8.0),
          child: Icon(iconData, color: Colors.white, size: 24.0),
        ),
      ),
    );
  }
}
