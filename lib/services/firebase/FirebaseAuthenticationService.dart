import 'package:firebase_auth/firebase_auth.dart';
import 'package:peer2peer/services/authentication_api.dart';

class FirebaseAuthenticationService implements AuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuthenticationService();

  @override
  Future<String> createUserWithEmailAndPassword({required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<String> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return "iioo";
  }

}