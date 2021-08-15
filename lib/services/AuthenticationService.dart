import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peer2peer/services/authentication_api.dart';

class AuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> createUserWithEmailAndPassword({required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  String currentUid() {
    final User? user = _firebaseAuth.currentUser;
    return user!.uid;
  }

  @override
  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  @override
  bool isEmailVerified() {
    final User? user = _firebaseAuth.currentUser;
    return user!.emailVerified;
  }

  @override
  Future<void> sendEmailVerification() async{
    final User? user = _firebaseAuth.currentUser;
    user!.sendEmailVerification();
  }

  @override
  Future<String> signInWithEmailAndPassword({required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

}