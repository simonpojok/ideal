class User {
  final String username;
  final String firstName;
  final String lastName;
  final String id;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  User.fromJson(Map<String, dynamic> user)
      : username = user['username'] ?? "",
        firstName = user["firstName"] ?? "",
        lastName = user["lastName"],
        id = user["id"];

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "id": id
    };
  }
}
