import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'create_tag_fab.dart';
import 'map_widget.dart';

class MapViewPage extends StatelessWidget {
  static const String routeName = '/maps_view_page';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Map'),
      ),
      drawer: NavigationDrawer(),
      body: MapWidget(),
      floatingActionButton: CreateTagFAB(androidFusedLocation: true));
}
