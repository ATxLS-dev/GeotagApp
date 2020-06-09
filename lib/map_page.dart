import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'create_tag_fab.dart';
import 'map_widget.dart';

class MapPage extends StatelessWidget {
  static const String routeName = '/map_page';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Map'),
      ),
      drawer: NavigationDrawer(),
      body: MapWidget(),
      floatingActionButton: CreateTagFAB()
  );
}