class User {
  String id;
  User({required this.id});
}

class AuthenticationMessage {
  bool status;
  String message;
  User? user;

  AuthenticationMessage({required this.status, required this.message, this.user});
}