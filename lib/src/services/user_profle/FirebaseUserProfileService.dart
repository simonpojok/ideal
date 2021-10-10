import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideal/src/models/user_model.dart';
import 'package:ideal/src/services/user_profle/UserProfileApi.dart';

class FirebaseUserProfileService implements UserProfileApi {
  final _firebaseAuth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Stream<QuerySnapshot<Object?>> getCurrentUser() {
    final user = _firebaseAuth.currentUser!;
    return _userCollection.where("userId", isEqualTo: user.uid).snapshots();
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
