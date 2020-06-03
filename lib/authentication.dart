import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;
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
    return user;
  }

  Future<void> signOut() async {
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