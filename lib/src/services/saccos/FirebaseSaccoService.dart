import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/services/saccos/SaccoServiceApi.dart';

class FirebaseSaccoService implements SaccoServiceApi {
  final _saccoCollection = FirebaseFirestore.instance.collection("saccos");
  @override
  Future<String> registerSacco(Sacco sacco) async {
    try {
      DocumentReference reference = await _saccoCollection.add(sacco.toJson());
      return reference.id;
    } catch (e) {
      print(e);
    }
    return "";
  }

  @override
  Stream<QuerySnapshot<Object?>> getSaccos() {
    return _saccoCollection.snapshots();
  }
}
