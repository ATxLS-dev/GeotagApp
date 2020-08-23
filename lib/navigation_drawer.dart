import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'default_neumorphic_style.dart';
import 'routes.dart';

enum NavRadio { mapPage, listPage, themeChangerPage, accountPage, settingsPage }

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer(this.pageIndex);
  final int pageIndex;
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  NavRadio navRadio;

  @override
  void initState() {
    super.initState();
    navRadio = NavRadio.values[widget.pageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 140.0),
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 84.0,
        height: 340.0,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Drawer(
            elevation: 0.0,
            child: Neumorphic(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
              style: sunkenNeumorphicStyle(radius: 37.0, fromLeft: false),
              child: NeumorphicTheme(
                  theme: defaultNeumorphicThemeData(),
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
            context, Routes.themeChangerPage);
        break;
      case NavRadio.accountPage:
        Navigator.pushReplacementNamed(
            context, Routes.loginPage);
        break;
      case NavRadio.settingsPage:
        Navigator.pushReplacementNamed(
            context, Routes.loginPage);
        break;
    }
  }

  Widget _navRadioField() {
    return Wrap(
      runSpacing: 10.0,
      children: <Widget>[
        neumorphicRadio(
            value: NavRadio.mapPage,
            icon: FeatherIcons.lifeBuoy),
        neumorphicRadio(
            value: NavRadio.listPage,
            icon: FeatherIcons.mapPin),
        neumorphicRadio(
            value: NavRadio.themeChangerPage,
            icon: FeatherIcons.moon),
        neumorphicRadio(
            value: NavRadio.accountPage,
            icon: FeatherIcons.bell),
        neumorphicRadio(
            value: NavRadio.settingsPage,
            icon: FeatherIcons.activity),
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
      style: neumorphicRadioStyle(isCircle: true)
    );
  }
}