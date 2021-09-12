import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/sacco.dart';

abstract class SaccoServiceApi {
  Future<String> registerSacco(Sacco sacco);

  Stream<QuerySnapshot> getSaccos();
}
