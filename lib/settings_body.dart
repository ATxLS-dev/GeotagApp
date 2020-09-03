import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'app_icon_changer.dart';
import 'neumorphic_styles.dart';

enum ThemeSelection { light , dark }

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {

  final neumorphicStyles = NeumorphicStyles();
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
        padding: EdgeInsets.all(18.0),
        child: NeumorphicTheme(
            theme: neumorphicStyles.baseTheme(),
            child: Wrap(
              runSpacing: 40.0,
              children: [
                themeRow(),
                helpRow(),
                reviewRow(),
                iconChanger()
              ],
            )
        )
    );
  }

  Widget themeRow() {
    return Row(
      children: <Widget>[
        Text(
          'Theme',
          style: neumorphicStyles.bodyTextStyle()
        ),
        Spacer(),
        neumorphicRadio(
            value: ThemeSelection.light,
            icon: FeatherIcons.sun,
            theme: 'Light',
            themeValue: true),
        SizedBox(width: 14.0),
        neumorphicRadio(
            value: ThemeSelection.dark,
            icon: FeatherIcons.moon,
            theme: 'Dark',
            themeValue: false),
      ],
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
        style: neumorphicStyles.radio(isCircle: true),
        child: Container(
            padding: EdgeInsets.all(14.0),
            child: Icon(icon, color: neumorphicStyles.invertedColor(), size: 28.0))
    );
  }

  Widget helpRow() {
    return Row(
      children: [
        Text('Info/FAQ', style: neumorphicStyles.bodyTextStyle()),
        Spacer(),
        NeumorphicButton(
          onPressed: () => print('help me'),
          style: neumorphicStyles.raisedCircle(),
          padding: EdgeInsets.all(14.0),
          child: Icon(FeatherIcons.lifeBuoy, color: neumorphicStyles.invertedColor(), size: 28.0),
        ),
      ],
    );
  }

  Widget reviewRow() {
    return Row(
        children: [
          Text('Leave a Review!', style: neumorphicStyles.bodyTextStyle()),
          Spacer(),
          NeumorphicButton(
            onPressed: () => print('help me'),
            style: neumorphicStyles.raisedCircle(),
            padding: EdgeInsets.all(14.0),
            child: Icon(FeatherIcons.star, color: neumorphicStyles.invertedColor(), size: 28.0),
          ),
        ]
    );
  }

  Widget iconChanger() {
    return Row(
      children: [
        Text('Set App Icon', style: neumorphicStyles.bodyTextStyle()),
        Spacer(),
        AppIconChanger()
      ],
    );
  }
}