import 'package:peer2peer/models/login/login_message.dart';
import 'package:peer2peer/models/user.dart';

abstract class AuthenticationService {
  Future<AuthenticationMessage> signInWithEmailAndPassword({required String email, required String password});
  Future<AuthenticationMessage> createUserWithEmailAndPassword({required String email, required String password});
}