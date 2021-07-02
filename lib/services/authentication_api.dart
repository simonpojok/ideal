abstract class AuthenticationService {
  Future<String> signInWithEmailAndPassword({required String email, required String password});
  Future<String> createUserWithEmailAndPassword({required String email, required String password});
}