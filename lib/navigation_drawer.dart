import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'routes.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _header(),
          _createDrawerItem(
              icon: FeatherIcons.lifeBuoy,
              text: 'Map',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mapPage)),
          _createDrawerItem(
              icon: FeatherIcons.mapPin,
              text: 'Tags',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.tagListPage)),
          _createDrawerItem(
              icon: FeatherIcons.moon,
              text: 'Friends',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.settingsPage)),
          _createDrawerItem(
              icon: FeatherIcons.bell,
              text: 'Login/Logout',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.loginPage)),
          _footer()
        ],
      ),
    );
  }

  Widget _header() =>
    UserAccountsDrawerHeader(
      accountName: Text('Bryce Kormylo'),
      accountEmail: Text('ATLS@mac.com', style: TextStyle(fontSize: 11.0),),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text('A', style: TextStyle(fontSize: 40.0)),
      ),
    );

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) =>
    ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);

  Widget _footer() =>
    Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          child: Column(
            children: <Widget>[
              Divider(),
              ListTile(
                leading: Icon(FeatherIcons.settings),
                title: Text('Settings'),
              ),
              Padding(padding: EdgeInsets.only(bottom: 24.0))
            ],
          ),
        ),
      ),
    );
}
