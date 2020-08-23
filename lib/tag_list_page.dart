import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'tag_list_body.dart';
import 'navigation_drawer.dart';
import 'navigation_button.dart';
import 'top_bar.dart';

class TagListPage extends StatelessWidget {

  static const String routeName = '/tag_list_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int pageIndex = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigationDrawer(pageIndex),
      body: Stack(
        children: <Widget>[
          Wrap(
            runSpacing: 10.0,
            children: <Widget>[
              TopBar('My Geotags', true),
              TagListBody(),
            ],
          ),
          NavigationButton(_scaffoldKey)
        ],
      ),
    );
  }
}