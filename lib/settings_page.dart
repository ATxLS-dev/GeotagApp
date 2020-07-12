import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    //Change to button
    return RadioListTile(
      title: Text('Dark Mode'),
      value: ThemeMode.dark,
      onChanged: (value) {
        setState(() {
        });
      },
      secondary: Icon(Icons.wb_sunny), groupValue: null,
    );
  }
}
