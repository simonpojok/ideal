import 'package:firebase_auth/firebase_auth.dart';

class LocalUser {
  final String username;
  final String firstName;
  final String lastName;
  final String id;
  final String nin;
  final String district;
  final String village;
  String email;

  LocalUser({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nin,
    required this.district,
    required this.village,
  });

  LocalUser.fromJson(Map<String, dynamic> user)
      : username = user['username'] ?? "",
        firstName = user["firstName"] ?? "",
        lastName = user["lastName"] ?? "",
        email = user["email"] ?? "",
        nin = user["nin"] ?? "",
        district = user["district"] ?? "",
        village = user["village"] ?? "",
        id = user["id"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "id": id,
      "email": email,
      "nin": nin,
      "district": district,
      "village": village
    };
  }

  LocalUser.fromFirebase(User user)
      : username = "",
        firstName = "",
        lastName = "",
        id = user.uid,
        email = user.email ?? "",
        nin = "",
        village = "",
        district = "";
}
