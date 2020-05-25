import 'package:flutter/material.dart';
import 'package:geotag/tag_list_view.dart';
import 'package:geotag/maps_view_page.dart';
import 'hive_tag_DB.dart';
import 'routes.dart';

void main() async {
  await openHive();
  runApp(MaterialApp(
    home: MapViewPage(),
    routes: {
      Routes.mapViewPage: (context) => MapViewPage(),
      Routes.hiveListPage: (context) => HiveListPage(),
    },
  ));
}
