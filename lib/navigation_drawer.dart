import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'routes.dart';

enum NavRadio { mapPage, listPage, settingsPage, accountPage, otherPage }

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  NavRadio navRadio;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
          width: 100.0,
          height: 376.0,
          child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: Drawer(
                elevation: 0.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: NeumorphicTheme(
                      theme: NeumorphicThemeData(
                        baseColor: NeumorphicColors.background,
                        lightSource: LightSource.topLeft,
                      ),
                      child: NeumorphicBackground(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Center(
                            child: _NavRadioField(
                                navRadio: navRadio,
                                onChanged: (navRadio) {
                                  switch (navRadio) {
                                    case NavRadio.mapPage:
                                      Navigator.pushReplacementNamed(
                                          context, Routes.mapPage);
                                      break;
                                    case NavRadio.listPage:
                                      Navigator.pushReplacementNamed(
                                          context, Routes.tagListPage);
                                      break;
                                    case NavRadio.settingsPage:
                                      Navigator.pushReplacementNamed(
                                          context, Routes.settingsPage);
                                      break;
                                    case NavRadio.accountPage:
                                      Navigator.pushReplacementNamed(
                                          context, Routes.loginPage);
                                      break;
                                    case NavRadio.otherPage:
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
              )
          )
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

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 18.0,
      children: <Widget>[
        neumorphicRadio(
            navValue: NavRadio.mapPage,
            icon: FeatherIcons.lifeBuoy),
        neumorphicRadio(
            navValue: NavRadio.listPage,
            icon: FeatherIcons.mapPin),
        neumorphicRadio(
            navValue: NavRadio.settingsPage,
            icon: FeatherIcons.moon),
        neumorphicRadio(
            navValue: NavRadio.accountPage,
            icon: FeatherIcons.bell),
        neumorphicRadio(
            navValue: NavRadio.otherPage,
            icon: FeatherIcons.activity),
      ],
    );
  }

  Widget neumorphicRadio({NavRadio navValue, IconData icon}) {
    return NeumorphicRadio(
      value: navValue,
      groupValue: navRadio,
      style: NeumorphicRadioStyle(
          selectedDepth: -12.0,
          unselectedDepth: 12.0,
          intensity: 0.75,
          boxShape: NeumorphicBoxShape
              .roundRect(BorderRadius.all(Radius.circular(14.0))),
          border: NeumorphicBorder(
              isEnabled: true,
              color: Colors.black.withOpacity(0.5),
              width: 1.0)
      ),
      onChanged: (value) => onChanged(value),
      child: Container(
          height: 50.0,
          width: 50.0,
          child: Icon(icon)
      ),
    );
  }
}