import 'package:ideal/src/models/user_model.dart';

abstract class AuthenticationApi {
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password});
  LocalUser getLocalUser();
}
