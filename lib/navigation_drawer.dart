import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/painting.dart';
import 'concave_decoration.dart';
import 'routes.dart';

class NavigationDrawer extends StatelessWidget {

  final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0)
      ),
      colors: [
        Color(0xffD9A47F),
        Color(0xff5B271F)
      ],
      depth: 4
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.transparent),
        child: Drawer(
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.only(top: 444.0, bottom: 16.0, right: 16.0),
            decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .buttonTheme
                    .colorScheme
                    .primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(24.0))
            ),
            child: Container(
              decoration: innerShadow,
              padding: EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  runSpacing: 18.0,
                  children: <Widget>[
                    _neumorphicButton(
                        context,
                        icon: FeatherIcons.lifeBuoy,
                        text: 'Map',
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, Routes.mapPage)),
                    _neumorphicButton(
                        context,
                        icon: FeatherIcons.mapPin,
                        text: 'Tags',
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, Routes.tagListPage)),
                    _neumorphicButton(
                        context,
                        icon: FeatherIcons.moon,
                        text: 'Settings',
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, Routes.settingsPage)),
                    _neumorphicButton(
                        context,
                        icon: FeatherIcons.bell,
                        text: 'Login/Logout',
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, Routes.loginPage)),
                    _neumorphicButton(
                        context,
                        icon: FeatherIcons.settings,
                        text: 'Login/Logout',
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, Routes.loginPage)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _neumorphicButton(BuildContext context,
      {IconData icon, String text, GestureTapCallback onTap}) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .buttonTheme
              .colorScheme
              .primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          border: Border.all(color: Colors.white, width: 1.0),
          boxShadow: [
            BoxShadow(
                color: Theme
                    .of(context)
                    .buttonTheme
                    .colorScheme
                    .primaryVariant
                    .withOpacity(0.5),
                offset: const Offset(9.0, 9.0),
                blurRadius: 16.0,
                spreadRadius: 2.0),
            BoxShadow(
                color: Theme
                    .of(context)
                    .buttonTheme
                    .colorScheme
                    .background
                    .withOpacity(0.5),
                offset: const Offset(-9.0, -9.0),
                blurRadius: 16.0,
                spreadRadius: 2.0)
              ],
            ),
        child: Center(
          child: Icon(icon, color: Colors.white, size: 28.0),
        ),
      ),
    );
  }
}