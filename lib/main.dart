import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'hive_type.dart';
import 'routes.dart';
import 'tag_list_page.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var _directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(_directory.path);
  Hive.registerAdapter(HiveTagFormatAdapter());
  await Hive.openBox<bool>('themeBox');
  await Hive.openBox<HiveTagFormat>('tagBox');
  runApp(GeotagApp());
}

class GeotagApp extends StatefulWidget {
  @override
  _GeotagAppState createState() => _GeotagAppState();
}

class _GeotagAppState extends State<GeotagApp> {

  final geotagThemeData = GeotagThemeData();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('themeBox').listenable(keys: ['themeKey']),
      builder: (context, box, widget) {
        var whichMode = box.get('themeKey', defaultValue: true);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MapPage(),
            theme: whichMode ? geotagThemeData.light : geotagThemeData.dark,
            routes: {
              Routes.mapPage: (context) => MapPage(),
              Routes.tagListPage: (context) => TagListPage(),
              Routes.settingsPage: (context) => SettingsPage()
            }
        );
      },
    );
  }
}