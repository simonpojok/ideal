import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/services/saccos/SaccoServiceApi.dart';

class FirebaseSaccoService implements SaccoServiceApi {
  final _saccoCollection = FirebaseFirestore.instance.collection("saccos");
  @override
  Future<void> registerSacco(Sacco sacco) async {
    try {
      DocumentReference reference = await _saccoCollection.add(sacco.toJson());
    } catch (e) {
      print(e);
    }
  }
}
