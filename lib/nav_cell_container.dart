import 'package:flutter/material.dart';
import 'map_widget.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[mapContainer(context), fabColumn(context)],
    );
  }

  Widget mapContainer(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: MapView(),
      ),
    );
  }

  Widget fabColumn(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      HomeFab(Colors.red, Icons.add),
      HomeFab(Colors.blue, Icons.search),
      HomeFab(Colors.green, Icons.map),
      HomeFab(Colors.yellow, Icons.directions_walk)
    ]);
  }
}

class HomeFab extends StatefulWidget {
  const HomeFab(this.fabColor, this.fabIcon);
  final Color fabColor;
  final IconData fabIcon;


  @override
  _HomeFabState createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: FloatingActionButton(
      backgroundColor: widget.fabColor,
      child: Icon(widget.fabIcon),
      onPressed: null,
    ));
  }
}
