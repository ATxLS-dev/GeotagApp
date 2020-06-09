import 'package:flutter/material.dart';
import 'login_widget.dart';
import 'navigation_drawer.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Login')
      ),
      drawer: NavigationDrawer(),
      body: LoginWidget()
  );
}