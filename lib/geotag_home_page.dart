import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nav_cell_container.dart';

class GeotagHomePage extends StatefulWidget {
  GeotagHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GeotagHomePageState createState() => _GeotagHomePageState();
}

class _GeotagHomePageState extends State<GeotagHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
          ),
        ),
        child: HomeBody(),
      ),
    );
  }
}
