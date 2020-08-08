import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class ThemeChangerBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ThemeRadio()
        ]
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
          child: _themeRadioField()
      ),
    );
  }

  Widget _themeRadioField() {
    return Wrap(
      runSpacing: 10.0,
      children: <Widget>[
        neumorphicRadio(
            value: ThemeSelection.light,
            icon: FeatherIcons.lifeBuoy,
            theme: 'light'),
        neumorphicRadio(
            value: ThemeSelection.dark,
            icon: FeatherIcons.mapPin,
            theme: 'dark'),
        neumorphicRadio(
            value: ThemeSelection.red,
            icon: FeatherIcons.moon,
            theme: 'red'),
        neumorphicRadio(
            value: ThemeSelection.green,
            icon: FeatherIcons.bell,
            theme: 'green'),
        neumorphicRadio(
            value: ThemeSelection.blue,
            icon: FeatherIcons.activity,
            theme: 'blue'),
      ],
    );
  }

  Widget neumorphicRadio({ThemeSelection value, IconData icon, String theme}) {
    return NeumorphicRadio(
      value: value,
      groupValue: themeSelection,
      onChanged: (value) {
        setState(() => themeSelection = value);
        print(theme);
      },
      child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(14.0),
                child: Icon(icon, color: Colors.white, size: 28.0)),
            Spacer(),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              child: Text('Light', style: TextStyle(color: Colors.white, fontSize: 20.0)),
            )
          ]
      ),
      style: NeumorphicRadioStyle(
          selectedColor: Color(0xff2E2C24),
          unselectedColor: Color(0xff2E2C24),
          selectedDepth: -4.0,
          unselectedDepth: 4.0,
          intensity: 1.0,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(27.0))),
          border: NeumorphicBorder(
              color: Color(0xffF8F4EC),
              width: 2.8)
      ),
    );
  }
}