import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'tag_list_widget.dart';
import 'navigation_drawer.dart';
import 'navigation_button.dart';
import 'top_bar.dart';

class TagListPage extends StatelessWidget {

  static const String routeName = '/tag_list_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          Wrap(
            runSpacing: 10.0,
            children: <Widget>[
              TopBar('My Geotags', true),
              TagListWidget(),
            ],
          ),
          NavigationButton(_scaffoldKey)
        ],
      ),
    );
  }
}