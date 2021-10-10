import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/services/user_profle/UserProfileApi.dart';

class FirebaseUserProfileService implements UserProfileApi {
  final _firebaseUser = FirebaseAuth.instance.currentUser!;
  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser() {
    return _userCollection.doc(_firebaseUser.uid).get();
  }

  @override
  Future<String> createOrUpdateCurrentUser(LocalUser localUser) async {
    final snapShot = await _userCollection.doc(localUser.id).get();
    if (snapShot.exists) {
      await _userCollection.doc(localUser.id).update(localUser.toMap());
    } else {
      await _userCollection.doc(localUser.id).set(localUser.toMap());
    }
    return _userCollection.doc(localUser.id).id;
  }
}
