import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotag/hive_tag_list.dart';
import 'package:geotag/maps_view_page.dart';

//import 'tag_list_page.dart';
import 'routes.dart';

void main() async {
  runApp(
      MaterialApp(
        home: MapViewPage(),
        routes: {
          Routes.mapViewPage: (context) => MapViewPage(),
//          Routes.tagListPage: (context) => TagListPage(),
          Routes.hiveListPage: (context) => HiveListPage()
        },
      )
  );

}