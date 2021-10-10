import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/user_model.dart';

abstract class UserProfileApi {
  Stream<QuerySnapshot<Object?>> getCurrentUser();
  Future<String> createOrUpdateCurrentUser(LocalUser localUser);
}