import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class TopBar extends StatelessWidget {
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

    return header(neumorphicStyle);
  }

  Widget header(NeumorphicStyle neumorphicStyle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 46.0, 20.0, 0.0),
      child: Neumorphic(
        style: neumorphicStyle,
        child: Container(
          padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
          child: Row(
            children: <Widget>[
              title(),
              Expanded(child: Container()),
              sortButton(neumorphicStyle)
            ],
          ),
        ),
      ),
    );
  }
  Widget sortButton(NeumorphicStyle neumorphicStyle) {
    return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 30.0,
          width: 60.0,
          child: Neumorphic(
            style: neumorphicStyle,
            child: Icon(FeatherIcons.arrowUpLeft),
          ),
        )
    );
  }

  Widget title() {
    return Align(
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
    );
  }
}
