import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/services/saccos/SaccoServiceApi.dart';

class SaccoBloc {
  final SaccoServiceApi saccoServiceApi;

  SaccoBloc(this.saccoServiceApi);

  Future<void> register(Sacco sacco) {
    return saccoServiceApi.registerSacco(sacco);
  }

  Stream<QuerySnapshot> saccos() {
    return saccoServiceApi.getSaccos();
  }
}
