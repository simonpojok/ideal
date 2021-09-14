import 'package:ideal/src/services/authentication/AuthenticationApi.dart';

class AuthenticationBloc {
  final AuthenticationApi api;

  AuthenticationBloc({required this.api});

  Future<String> signup(
      {required String email, required String password}) async {
    return api.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    return api.signInWithEmailAndPassword(email: email, password: password);
  }
}
