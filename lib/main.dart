import 'package:flutter/material.dart';
import 'config.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GeotagApp());
}

class GeotagApp extends StatefulWidget {
  @override
  _GeotagAppState createState() => _GeotagAppState();
}

class _GeotagAppState extends State<GeotagApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapPage(),
      theme: geotagThemeData.lightTheme,
      darkTheme: geotagThemeData.darkTheme,
      themeMode: currentTheme.currentThemeMode(),
      routes: {
        Routes.mapPage: (context) => MapPage(),
        Routes.tagListPage: (context) => TagListPage(),
        Routes.settingsPage: (context) => SettingsPage()
      },
    );
  }
}
