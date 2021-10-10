import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/services/authentication/AuthenticationApi.dart';

class FirebaseAuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  LocalUser getLocalUser() {
    return LocalUser.fromFirebase(_firebaseAuth.currentUser!);
  }

}
