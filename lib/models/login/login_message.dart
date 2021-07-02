import '../user.dart';

class AuthenticationMessage {
  bool status;
  String message;
  User? user;

  AuthenticationMessage({required this.status, required this.message, this.user});
}