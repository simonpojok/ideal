import 'package:firebase_auth/firebase_auth.dart';

import 'models/authentication_message.dart';

abstract class AuthenticationApi {
  FirebaseAuth getFirebaseAuth();
  Future<String> currentUid();
  Future<void> signOut();
  Future<String> signInWithEmailAndPassword({String email, String password});
  Future<String> createUserWithEmailAndPassword({String email, String password});
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
}