import 'package:flutter/material.dart';
import 'package:geotag/config.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'theme.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveDBManager.hiveInit();
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
      theme: GeotagThemeData().lightTheme,
      darkTheme: GeotagThemeData().darkTheme,
      themeMode: currentTheme.currentThemeMode(),
      routes: {
        Routes.mapPage: (context) => MapPage(),
        Routes.tagListPage: (context) => TagListPage(),
        Routes.settingsPage: (context) => SettingsPage()
      },
    );
  }
}
