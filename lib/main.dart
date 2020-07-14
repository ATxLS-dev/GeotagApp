import 'package:flutter/material.dart';
import 'package:geotag/theme_manager.dart';
import 'config.dart';
import 'routes.dart';
import 'hive_database.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveDB = HiveDatabase();
  hiveDB.initHive();
  runApp(GeotagApp());
}

class GeotagApp extends StatefulWidget {
  @override
  _GeotagAppState createState() => _GeotagAppState();
}

class _GeotagAppState extends State<GeotagApp> {

  ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    super.initState();
    themeBloc.themeStream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: themeBloc.themeStream,
      builder: (context, snapshot) {
        return MaterialApp(
            home: MapPage(),
            theme: snapshot.hasData ? snapshot.data : geotagThemeData.lightTheme,
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
