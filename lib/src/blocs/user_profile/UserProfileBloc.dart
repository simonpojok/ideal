import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/services/user_profle/UserProfileApi.dart';

class UserProfileBloc {
  final UserProfileApi api;

  UserProfileBloc({required this.api});

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserProfile() {
    return api.getCurrentUser();
  }

  Future<String> createOrUpdateUserProfile(LocalUser localUser) {
    return api.createOrUpdateCurrentUser(localUser);
  }
}
