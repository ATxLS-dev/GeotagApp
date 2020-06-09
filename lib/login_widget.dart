import 'package:flutter/material.dart';
import 'config.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({this.loginCallback});
  final VoidCallback loginCallback;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  String _email, _password, _errorMessage;
  bool _isLoginForm, _isLoading;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = '';
      _isLoading = true;
    });
    if (validateAndSave()) {
      var userId = '';
      try {
        if (_isLoginForm) {
          userId = await authenticator.logIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await authenticator.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {_isLoading = false;});
        if (userId.isNotEmpty && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = '';
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = '';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        showForm(),
        showProgressIndicator()
      ],
    );
  }

  Widget showProgressIndicator() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0
    );
  }

  Widget showForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage()
          ],
        ),
      ),
    );
  }

  Widget showLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/geotag_icon/1024.png')),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email', icon: Icon(Icons.email, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'email cannot be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password', icon: Icon(Icons.lock, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'password cannot be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: RaisedButton(
          elevation: 5.0,
          shape:
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
          color: Colors.blue,
          child: Text(
            _isLoginForm ? 'login' : 'sign up',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget showSecondaryButton() {
    return FlatButton(
      child: Text(
        _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      onPressed: toggleFormMode,
    );
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm =! _isLoginForm;
    });
  }

  Widget showErrorMessage() {
    if (_errorMessage.isNotEmpty ?? _errorMessage != null) {
      return Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300
        ),
      );
    } else {
      return Container(
        height: 0.0,
      );
    }
  }
//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content:
//              new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                toggleFormMode();
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
}

//import 'package:flutter/material.dart';
//import 'package:geotag/authenticator.dart';
//import 'login_widget.dart';
//import 'map_page.dart';
//import 'config.dart';
//
//class RootPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _RootPageState();
//}
//
//class _RootPageState extends State<RootPage> {
//
//  //Wont work at all but I hated how he built his code.
//  //Manage this shit with authenticator.  Just kill this root page.
//  //Login isn't even necessary anyways, realistically I don't even need it.
//  @override
//  Widget build(BuildContext context) {
//    switch (authenticator.authenticatorStatus) {
//      case AuthenticatorStatus.undetermined:
//        return buildWaitingScreen();
//        break;
//      case AuthenticatorStatus.notLoggedIn:
//        return LoginPage();
//        break;
//      case AuthenticatorStatus.loggedIn:
//        if (authenticator.userID.isNotEmpty && authenticator.userID != null) {
//          //CHANGE TO MAP PAGE
//          return MapPage();
//        } else {
//          return buildWaitingScreen();
//        }
//        break;
//      default:
//        return buildWaitingScreen();
//    }
//  }
//
//  Widget buildWaitingScreen() {
//    return Scaffold(
//      body: Container(
//        alignment: Alignment.center,
//        child: CircularProgressIndicator(),
//      ),
//    );
//  }
//}