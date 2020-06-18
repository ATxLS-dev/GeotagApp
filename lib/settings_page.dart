import 'package:flutter/material.dart';
import 'package:geotag/config.dart';
import 'package:geotag/theme_manager.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings_page';

  @override
  Widget build(BuildContext context) => ThemeModeSwitch();
}

class ThemeModeSwitch extends StatefulWidget {
  ThemeModeSwitch({Key key}) : super(key: key);

  @override
  _ThemeModeSwitchState createState() => _ThemeModeSwitchState();
}

class _ThemeModeSwitchState extends State<ThemeModeSwitch> {
  var _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    _themeMode = ThemeController.to.themeMode;
    //Change to button
    return RadioListTile(
      title: Text('Dark Mode'),
      value: ThemeMode.dark,
      onChanged: (value) {
        setState(() {
          _themeMode = value;
          Get.changeThemeMode(_themeMode);
        });
      },
      secondary: Icon(Icons.wb_sunny), groupValue: null,
    );
  }
}
