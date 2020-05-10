import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotag/maps_view_page.dart';
import 'tag_list_page.dart';
import 'routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_tag.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<HiveTag>('hiveTagBox');
  runApp(
      MaterialApp(
        home: MapViewPage(),
        routes: {
          Routes.mapViewPage: (context) => MapViewPage(),
          Routes.tagListPage: (context) => TagListPage()
        },
      )
  );
}

