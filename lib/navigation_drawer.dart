import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              icon: FontAwesomeIcons.bandcamp,
              text: 'Map',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mapViewPage)),
          _createDrawerItem(
              icon: FontAwesomeIcons.featherAlt,
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

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
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
                leading: FaIcon(FontAwesomeIcons.anchor),
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
