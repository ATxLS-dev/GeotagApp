import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'neumorphic_styles.dart';
import 'routes.dart';

enum NavRadio { mapPage , listPage , themeChangerPage }

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer(this.pageIndex);
  final int pageIndex;
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  final neumorphicStyles = LightNeumorphicStyles();
  NavRadio navRadio;

  @override
  void initState() {
    super.initState();
    navRadio = NavRadio.values[widget.pageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 132.0),
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 84.0,
        height: 206.0,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Drawer(
            elevation: 0.0,
            child: Neumorphic(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              style: neumorphicStyles.sunkenSemiCircle(radius: 37.0, fromLeft: false),
              child: NeumorphicTheme(
                  theme: neumorphicStyles.baseTheme(),
                  child: _navRadioField()
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navRadioPusher(NavRadio navRadio) {
    switch (navRadio) {
      case NavRadio.mapPage:
        Navigator.pushReplacementNamed(
            context, Routes.mapPage);
        break;
      case NavRadio.listPage:
        Navigator.pushReplacementNamed(
            context, Routes.tagListPage);
        break;
      case NavRadio.themeChangerPage:
        Navigator.pushReplacementNamed(
            context, Routes.settingsPage);
        break;
    }
  }

  Widget _navRadioField() {
    return Wrap(
      runSpacing: 10.0,
      children: <Widget>[
        neumorphicRadio(
            value: NavRadio.mapPage,
            icon: FeatherIcons.map),
        neumorphicRadio(
            value: NavRadio.listPage,
            icon: FeatherIcons.list),
        neumorphicRadio(
            value: NavRadio.themeChangerPage,
            icon: FeatherIcons.settings)
      ],
    );
  }

  Widget neumorphicRadio({NavRadio value, IconData icon}) {
    return NeumorphicRadio(
      value: value,
      groupValue: navRadio,
      onChanged: (value) {
        setState(() => navRadio = value);
        _navRadioPusher(value);
      },
      child: Container(
          padding: EdgeInsets.all(14.0),
          child: Icon(icon, color: Colors.white, size: 28.0)
      ),
      style: neumorphicStyles.radio(isCircle: true)
    );
  }
}