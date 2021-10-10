import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/user_model.dart';

abstract class UserProfileApi {
  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser();
  Future<String> createOrUpdateCurrentUser(LocalUser localUser);
}