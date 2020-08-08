import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class SettingsBody extends StatelessWidget{

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
    return Column(
      children: <Widget>[
        _themeSelectorTile(),
      ],
    );
  }

  Widget _themeSelectorTile() {
    return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 80.0),
            child: _labelTitle()
          ),
          SizedBox(height: 10.0),
          Neumorphic(
            style: _neumorphicStyle(
                depth: -4.0,
                color: Colors.transparent,
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(37.0)))),
            child: ThemeRadio()
            ),
        ],
    );
  }

  Widget _labelTitle() {
    return Neumorphic(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        style: _neumorphicStyle(
            depth: 2.0,
            color: Colors.transparent,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(
                Radius.circular(20.0)))),
        child: Text('Theme', style: TextStyle(fontSize: 18.0))
    );
  }
}

enum ThemeSelection { light , dark , red , green , blue }

class ThemeRadio extends StatefulWidget {
  @override
  _ThemeRadioState createState() => _ThemeRadioState();
}

class _ThemeRadioState extends State<ThemeRadio> {

  ThemeSelection themeSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: NeumorphicTheme(
          theme: NeumorphicThemeData(
            baseColor: NeumorphicColors.background,
            lightSource: LightSource.topLeft,
          ),
          child: _ThemeRadioField(
              themeSelection: themeSelection,
              onChanged: (themeSelection) {
                switch (themeSelection) {
                  case ThemeSelection.light:
                  //Change theme
                    break;
                  case ThemeSelection.dark:
                  //Change theme
                    break;
                  case ThemeSelection.red:
                  //Change theme
                    break;
                  case ThemeSelection.green:
                  //Change theme
                    break;
                  case ThemeSelection.blue:
                  //Change theme
                    break;
                }}
          )
      ),
    );
  }
}

class _ThemeRadioField extends StatelessWidget {

  _ThemeRadioField({
    @required this.themeSelection,
    @required this.onChanged,
  });

  final ThemeSelection themeSelection;
  final ValueChanged<ThemeSelection> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: <Widget>[
        neumorphicRadio(
            themeValue: ThemeSelection.light,
            icon: FeatherIcons.lifeBuoy),
        neumorphicRadio(
            themeValue: ThemeSelection.dark,
            icon: FeatherIcons.mapPin),
        neumorphicRadio(
            themeValue: ThemeSelection.red,
            icon: FeatherIcons.moon),
        neumorphicRadio(
            themeValue: ThemeSelection.green,
            icon: FeatherIcons.bell),
        neumorphicRadio(
            themeValue: ThemeSelection.blue,
            icon: FeatherIcons.activity),
      ],
    );
  }

  Widget neumorphicRadio({ThemeSelection themeValue, IconData icon}) {
    return NeumorphicRadio(
      value: themeValue,
      groupValue: themeSelection,
      style: NeumorphicRadioStyle(
          selectedColor: Color(0xff2E2C24),
          unselectedColor: Color(0xff2E2C24),
          selectedDepth: -4.0,
          unselectedDepth: 4.0,
          intensity: 1.0,
          boxShape: NeumorphicBoxShape.circle(),
          border: NeumorphicBorder(
              color: Color(0xffF8F4EC),
              width: 2.8)
      ),
      onChanged: (value) => onChanged(value),
      child: Container(
          padding: EdgeInsets.all(14.0),
          child: Icon(icon, color: Colors.white, size: 28.0)
      ),
    );
  }
}
