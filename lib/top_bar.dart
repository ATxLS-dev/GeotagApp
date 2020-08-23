import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'default_neumorphic_style.dart';

class TopBar extends StatelessWidget {
  TopBar(this.titleText, this.hasButton);

  @required
  final String titleText;
  @required
  final bool hasButton;

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
      style: sunkenNeumorphicStyle(radius: 30.0, fromLeft: false),
      child: Container(
        child: Neumorphic(
          style: defaultNeumorphicStyle(
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
        style: defaultNeumorphicStyle(
            depth: 2.0,
            color: Colors.transparent,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0)))),
        child: Container(
          child: Text(
            titleText,
            style: TextStyle(fontSize: 24.0),
          ),
        )
    );
  }
}
