import 'package:flutter/material.dart';
import 'package:geotag/tag_list_view.dart';
import 'package:geotag/map_view_page.dart';
import 'hive_db_manager.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _hiveDBManager = HiveDBManager();
  await _hiveDBManager.hiveInit();
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
      routes: {
        Routes.mapViewPage: (context) => MapViewPage(),
        Routes.hiveListPage: (context) => HiveListPage(),
      },
    );
  }
}
