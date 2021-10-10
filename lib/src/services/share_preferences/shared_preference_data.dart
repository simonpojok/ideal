import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static Future<LocalUser>  getCurrentUser()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = FirebaseAuth.instance.currentUser!;
    String username = prefs.getString("username") ?? "";
    String firstName = prefs.getString("first_name") ?? "";
    String lastName = prefs.getString("last_name") ?? "";
    return LocalUser(id: user.uid, username: username, firstName: firstName, lastName: lastName, email: user.email ?? "");
  }
}