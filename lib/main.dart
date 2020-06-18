import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_manager.dart';
import 'config.dart';
import 'routes.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(GeotagApp());
}

class GeotagApp extends StatefulWidget {
  @override
  _GeotagAppState createState() => _GeotagAppState();
}

class _GeotagAppState extends State<GeotagApp> {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromHive();
    return GetMaterialApp(
      home: MapPage(),
      theme: geotagThemeData.lightTheme,
      darkTheme: geotagThemeData.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        Routes.mapPage: (context) => MapPage(),
        Routes.tagListPage: (context) => TagListPage(),
        Routes.settingsPage: (context) => SettingsPage(),
        Routes.loginPage: (context) => LoginPage()
      }
    );
  }
}
