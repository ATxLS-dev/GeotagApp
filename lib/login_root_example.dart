import 'package:flutter/material.dart';
import 'package:geotag/authenticator.dart';
import 'login_page.dart';
import 'map_page.dart';
import 'config.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  //Wont work at all but I hated how he built his code.
  //Manage this shit with authenticator.  Just kill this root page.
  //Login isn't even necessary anyways, realistically I don't even need it.
  @override
  Widget build(BuildContext context) {
    switch (authenticator.authenticatorStatus) {
      case AuthenticatorStatus.undetermined:
        return buildWaitingScreen();
        break;
      case AuthenticatorStatus.notLoggedIn:
        return LoginPage();
        break;
      case AuthenticatorStatus.loggedIn:
        if (authenticator.userID.isNotEmpty && authenticator.userID != null) {
          //CHANGE TO MAP PAGE
          return MapPage();
        } else {
          return buildWaitingScreen();
        }
        break;
      default:
        return buildWaitingScreen();
    }
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}