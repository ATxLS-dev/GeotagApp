import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class TopBar extends StatelessWidget {
  TopBar(this.titleText, this.hasButton);

  @required
  final String titleText;
  @required
  final bool hasButton;

  static final _cornerRadius = Radius.circular(30.0);

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
      padding: EdgeInsets.only(top: 44.0),
      child: Row(
        children: <Widget>[
          title(),
          Expanded(child: Container()),
          hasButton ? sortButton() : Expanded(child: Container())
        ],
      ),
    );
  }

  Widget sortButton() {
    return Neumorphic(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      style: _neumorphicStyle(
          depth: -4.0,
          color: Colors.transparent,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
              topLeft: _cornerRadius, bottomLeft: _cornerRadius))),
      child: Container(
        child: Neumorphic(
          style: _neumorphicStyle(
            depth: 4.0,
            boxShape: NeumorphicBoxShape.circle(),
            color: Color(0xff2E2C24)),
          padding: EdgeInsets.all(8.0),
          child: Icon(FeatherIcons.moreHorizontal,
              color: Colors.white, size: 24.0),
        ),
      ),
    );
  }

  Widget title() {
    return Neumorphic(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        style: _neumorphicStyle(
            depth: 2.0,
            color: Colors.transparent,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                topRight: _cornerRadius, bottomRight: _cornerRadius))),
        child: Container(
          child: Text(
            titleText,
            style: TextStyle(fontSize: 24.0),
          ),
        )
    );
  }
}
