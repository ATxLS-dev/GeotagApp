import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'default_neumorphic_style.dart';
import 'theme_manager.dart';

enum ThemeSelection { light , dark , red , green , blue }

class ThemeChangerBody extends StatefulWidget {
  @override
  _ThemeChangerBodyState createState() => _ThemeChangerBodyState();
}

class _ThemeChangerBodyState extends State<ThemeChangerBody> {

  ThemeSelection themeSelection;
  final themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: NeumorphicTheme(
            theme: defaultNeumorphicThemeData(),
            child: Wrap(
              runSpacing: 10.0,
              children: <Widget>[
                neumorphicRadio(
                    value: ThemeSelection.light,
                    icon: FeatherIcons.lifeBuoy,
                    theme: 'light',
                    themeIndex: 0),
                neumorphicRadio(
                    value: ThemeSelection.dark,
                    icon: FeatherIcons.mapPin,
                    theme: 'dark',
                    themeIndex: 1),
                neumorphicRadio(
                    value: ThemeSelection.red,
                    icon: FeatherIcons.moon,
                    theme: 'red',
                    themeIndex: 2),
                neumorphicRadio(
                    value: ThemeSelection.green,
                    icon: FeatherIcons.bell,
                    theme: 'green',
                    themeIndex: 3),
                neumorphicRadio(
                    value: ThemeSelection.blue,
                    icon: FeatherIcons.activity,
                    theme: 'blue',
                    themeIndex: 4),
              ],
            ))
    );
  }

  Widget neumorphicRadio({ThemeSelection value, IconData icon, String theme, int themeIndex}) {
    return NeumorphicRadio(
        value: value,
        groupValue: themeSelection,
        onChanged: (value) {
          setState(() => themeSelection = value);
          themeBloc.saveTheme(themeIndex);
          themeBloc.syncTheme();
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
                child: Text(theme, style: TextStyle(color: Colors.white, fontSize: 20.0)),
              )
            ]
        ),
        style: neumorphicRadioStyle(isCircle: false)
    );
  }
}