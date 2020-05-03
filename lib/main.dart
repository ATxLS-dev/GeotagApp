import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotag/maps_view_page.dart';
import 'tag_list_page.dart';
import 'routes.dart';

void main() => runApp(
  MaterialApp(
    home: MapViewPage(),
    routes: {
      Routes.mapViewPage: (context) => MapViewPage(),
      Routes.tagListPage: (context) => TagListPage()
    },
  )
);

