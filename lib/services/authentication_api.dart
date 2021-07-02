import 'models/authentication_message.dart';

abstract class AuthenticationService {
  Future<AuthenticationMessage> signInWithEmailAndPassword({required String email, required String password});
  Future<AuthenticationMessage> createUserWithEmailAndPassword({required String email, required String password});
}