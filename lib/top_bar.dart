import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'neumorphic_styles.dart';

class TopBar extends StatelessWidget {
  TopBar(this.titleText, this.hasButton);

  @required
  final String titleText;
  @required
  final bool hasButton;

  final neumorphicStyles = NeumorphicStyles();

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
      style: neumorphicStyles.sunkenArch(radius: 30.0, fromLeft: false),
      child: Container(
        child: Neumorphic(
          style: neumorphicStyles.defaultStyle(
            depth: 4.0,
            boxShape: NeumorphicBoxShape.circle()),
          padding: EdgeInsets.all(8.0),
          child: Icon(FeatherIcons.moreHorizontal,
              color: neumorphicStyles.invertedColor(), size: 24.0),
        ),
      ),
    );
  }

  Widget title() {
    return Neumorphic(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        style: neumorphicStyles.sunkenArch(
            fromLeft: true,
            radius: 30.0),
        child: Container(
          child: Text(
            titleText,
            style: TextStyle(fontSize: 24.0, color: neumorphicStyles.invertedColor()),
          ),
        )
    );
  }
}
