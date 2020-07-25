import 'package:flutter/material.dart';
import 'package:geotag/theme_manager.dart';
import 'routes.dart';
import 'hive_database.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'login_page.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveDatabase = HiveDatabase();
  hiveDatabase.initialize();
  runApp(GeotagApp());
}

class GeotagApp extends StatefulWidget {
  @override
  _GeotagAppState createState() => _GeotagAppState();
}

class _GeotagAppState extends State<GeotagApp> {

  final geotagThemeData = GeotagThemeData();
  final themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: themeBloc.themeStream,
      builder: (context, snapshot) {
        return MaterialApp(
            home: MapPage(),
            theme: snapshot.data ?? geotagThemeData.lightTheme,
            routes: {
              Routes.mapPage: (context) => MapPage(),
              Routes.tagListPage: (context) => TagListPage(),
              Routes.settingsPage: (context) => SettingsPage(),
              Routes.loginPage: (context) => LoginPage()
            }
        );
      },
    );
  }
}