import 'package:flutter/material.dart';
import 'package:geotag/config.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.highlight),
          onPressed: () => {
                currentTheme.switchTheme(),
              }),
    );
  }
}
