import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'concave_decoration.dart';
import 'routes.dart';

enum NavRadio { toMap, toList, toSettings, toAccount, toOther }

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int groupValue;
  NavRadio navRadio;

  @override
  void initState() {
    super.initState();
    navRadio = NavRadio.toMap;
  }

  @override
  Widget build(BuildContext context) {

    final innerShadow = ConcaveDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        colors: [
          Theme.of(context).buttonTheme.colorScheme.background,
          Theme.of(context).buttonTheme.colorScheme.primaryVariant
        ],
        depth: 4);

    return SizedBox(
      width: 100.0,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.only(top: 444.0, bottom: 16.0, right: 16.0),
            decoration: BoxDecoration(
                color: Theme.of(context).buttonTheme.colorScheme.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            child: Container(
              decoration: innerShadow,
              padding: EdgeInsets.all(18.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _NavRadioField(
                      navRadio: navRadio,
                      onChanged: (navRadio) {
                        switch (navRadio) {
                          case NavRadio.toMap:
                            Navigator.pushReplacementNamed(
                                context, Routes.mapPage);
                            break;
                          case NavRadio.toList:
                            Navigator.pushReplacementNamed(
                                context, Routes.tagListPage);
                            break;
                          case NavRadio.toSettings:
                            Navigator.pushReplacementNamed(
                                context, Routes.settingsPage);
                            break;
                          case NavRadio.toAccount:
                            Navigator.pushReplacementNamed(
                                context, Routes.loginPage);
                            break;
                          case NavRadio.toOther:
                            Navigator.pushReplacementNamed(
                                context, Routes.loginPage);
                            break;
                        }
                      })
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavRadioField extends StatelessWidget {

  _NavRadioField({
    @required this.navRadio,
    @required this.onChanged,
  });

  final NavRadio navRadio;
  final ValueChanged<NavRadio> onChanged;

  final neumorphicRadioStyle = NeumorphicRadioStyle(
      selectedDepth: -4.0,
      unselectedDepth: 4.0,
      intensity: 0.75,
      boxShape:
          NeumorphicBoxShape
              .roundRect(BorderRadius.all(Radius.circular(14.0))),
      border: NeumorphicBorder(
          isEnabled: true,
          color: Colors.white.withOpacity(0.5),
          width: 1.0)
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 18.0,
        children: <Widget>[
          neumorphicRadio(
              navValue: NavRadio.toMap,
              icon: FeatherIcons.lifeBuoy),
          neumorphicRadio(
              navValue: NavRadio.toList,
              icon: FeatherIcons.mapPin),
          neumorphicRadio(
              navValue: NavRadio.toSettings,
              icon: FeatherIcons.moon),
          neumorphicRadio(
              navValue: NavRadio.toAccount,
              icon: FeatherIcons.bell),
          neumorphicRadio(
              navValue: NavRadio.toOther,
              icon: FeatherIcons.activity),
        ],
    );
  }

  Widget neumorphicRadio({NavRadio navValue, IconData icon}) {
    return NeumorphicRadio(
      value: navValue,
      groupValue: navRadio,
      style: neumorphicRadioStyle,
      onChanged: (value) => onChanged(value),
      child: Container(
        height: 50.0,
        width: 50.0,
        child: Icon(icon),
      ),
    );
  }
}