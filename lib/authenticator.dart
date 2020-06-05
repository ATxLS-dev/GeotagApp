import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  final _firebaseAuth = FirebaseAuth.instance;
  AuthenticatorStatus authenticatorStatus = AuthenticatorStatus.undetermined;
  String userID;

  Future<String> logIn(String email, String password) async {
    var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;
    authenticatorStatus = AuthenticatorStatus.loggedIn;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    var user = await _firebaseAuth.currentUser();
    if (user != null) {
      userID = user?.uid.toString();
    }
    authenticatorStatus = user?.uid == null ? AuthenticatorStatus.notLoggedIn : AuthenticatorStatus.loggedIn;
    return user;
  }

  Future<void> logOut() async {
    authenticatorStatus = AuthenticatorStatus.notLoggedIn;
    userID = '';
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    var user = await _firebaseAuth.currentUser();
    await user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    var user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}

enum AuthenticatorStatus {
  undetermined,
  notLoggedIn,
  loggedIn
}