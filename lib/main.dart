import 'package:flutter/material.dart';
import 'package:geotag/theme_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'hive_type.dart';
import 'routes.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'theme_changer_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var _directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(_directory.path);
  Hive.registerAdapter(HiveTagFormatAdapter());
  await Hive.openBox('themeBox');
  await Hive.openBox('tagBox');
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
            debugShowCheckedModeBanner: false,
            home: MapPage(),
            theme: snapshot.data ?? geotagThemeData.light,
            routes: {
              Routes.mapPage: (context) => MapPage(),
              Routes.tagListPage: (context) => TagListPage(),
              Routes.themeChangerPage: (context) => ThemeChangerPage(),
              Routes.loginPage: (context) => LoginPage(),
              Routes.settingsPage: (context) => SettingsPage()
            }
        );
      },
    );
  }
}