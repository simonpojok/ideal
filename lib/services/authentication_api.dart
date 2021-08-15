import 'package:firebase_auth/firebase_auth.dart';

import 'models/authentication_message.dart';

abstract class AuthenticationApi {
  FirebaseAuth getFirebaseAuth();
  String currentUid();
  Future<void> signOut();
  Future<String> signInWithEmailAndPassword({required String email, required String password});
  Future<String> createUserWithEmailAndPassword({required String email, required String password});
  Future<void> sendEmailVerification();
  bool isEmailVerified();
}