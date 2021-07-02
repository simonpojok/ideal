import 'package:firebase_auth/firebase_auth.dart';
import 'package:peer2peer/models/login/login_message.dart';
import 'package:peer2peer/models/user.dart' as PeerToPeerUser;
import 'package:peer2peer/services/authentication_api.dart';

class FirebaseAuthenticationService implements AuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuthenticationService();

  @override
  Future<AuthenticationMessage> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthenticationMessage(
          status: true, message: 'Registration Completed Successfully');
    } on FirebaseAuthException catch (e) {
      final response = AuthenticationMessage(
          status: false, message: 'Registration Completed Successfully');
      return response;
    }
  }

  @override
  Future<AuthenticationMessage> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthenticationMessage(
        status: true,
        message: 'SignIn Successful',
        user: PeerToPeerUser.User(id: userCredential.user!.uid),
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code} ${e.message}');
      print(e.message);
      final message = AuthenticationMessage(
        status: false,
        message: 'SignIn Successful',
      );
      if (e.code == 'user-not-found') {
        message.message = 'No User found with this email';
      }
      if (e.code == '') {
        message.message = 'Invalid Email or Password';
      }
      return message;
    }
  }
}
