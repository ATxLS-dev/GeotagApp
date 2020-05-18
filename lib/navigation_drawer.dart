import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _header(),
          _createDrawerItem(
              icon: Icons.terrain,
              text: 'Map',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mapViewPage)),
          _createDrawerItem(
              icon: FeatherIcons.box,
              text: 'Tags',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.hiveListPage)),
          _footer()
        ],
      ),
    );
  }

  Widget _header() {
    return UserAccountsDrawerHeader(
      accountName: Text('Account name'),
      accountEmail: Text('ATLS@mac.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text(
          'A',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap
    );
  }

  Widget _footer() {
    return Container(
        child: Align(
        alignment: FractionalOffset.bottomCenter,
          child: Container(
            child: Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  leading: Icon(FeatherIcons.anchor),
                  title: Text('Settings'),
                ),
                Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                )
              ],
            ),
          ),
        ),
    );
  }
}