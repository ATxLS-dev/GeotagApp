import 'package:flutter/material.dart';
import 'package:geotag/config.dart';
import 'tag_list_view.dart';
import 'map_view_page.dart';
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
      home: MapViewPage(),
      theme: GeotagThemeData().lightTheme,
      darkTheme: GeotagThemeData().darkTheme,
      themeMode: currentTheme.currentThemeMode(),
      routes: {
        Routes.mapViewPage: (context) => MapViewPage(),
        Routes.hiveListPage: (context) => HiveListPage(),
        Routes.settingsPage: (context) => SettingsPage()
      },
    );
  }
}
