import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'tag_list_widget.dart';
import 'navigation_drawer.dart';

class TagListPage extends StatelessWidget {
  static const String routeName = '/tag_list_page';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text('My Tags'),
    ),
    endDrawer: NavigationDrawer(),
    body: TagListWidget(),
  );
}