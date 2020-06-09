import 'package:flutter/material.dart';
import 'package:geotag/config.dart';
import 'package:geotag/theme_manager.dart';

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
  bool _darkModeToggle = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Dark Mode'),
      value: _darkModeToggle,
      onChanged: (bool value) {
        setState(() {
          _darkModeToggle = value;
          currentTheme.setTheme(SelectedTheme.dark);
        });
      },
      secondary: Icon(Icons.wb_sunny),
    );
  }
}
