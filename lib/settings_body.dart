import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:hive/hive.dart';
import 'neumorphic_styles.dart';

enum ThemeSelection { light , dark }

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {

  final neumorphicStyles = LightNeumorphicStyles();
  ThemeSelection themeSelection;

  @override
  void initState() {
    super.initState();
    if (Hive.box<bool>('themeBox').get('themeKey')) {
      themeSelection = ThemeSelection.light;
    } else {
      themeSelection = ThemeSelection.dark;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: NeumorphicTheme(
            theme: neumorphicStyles.baseTheme(),
            child: Wrap(
              runSpacing: 14.0,
              children: <Widget>[
                neumorphicRadio(
                    value: ThemeSelection.light,
                    icon: FeatherIcons.sun,
                    theme: 'Light',
                    themeValue: true),
                neumorphicRadio(
                    value: ThemeSelection.dark,
                    icon: FeatherIcons.moon,
                    theme: 'Dark',
                    themeValue: false),
              ],
            )
        )
    );
  }

  Widget neumorphicRadio({ThemeSelection value, IconData icon, String theme, bool themeValue}) {
    return NeumorphicRadio(
        value: value,
        groupValue: themeSelection,
        onChanged: (value) {
          setState(() => themeSelection = value);
          Hive.box<bool>('themeBox').put('themeKey', themeValue);
        },
        style: neumorphicStyles.radio(isCircle: false),
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
    );
  }
}