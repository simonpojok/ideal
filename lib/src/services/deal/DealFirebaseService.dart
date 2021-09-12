import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/deal_model.dart';
import 'package:ideal/src/services/deal/DealApi.dart';

class DealFirebaseService implements DealApi {
  final _dealCollection = FirebaseFirestore.instance.collection("loan_deals");

  @override
  Stream<QuerySnapshot<Object?>> getDeals() {
    return _dealCollection.snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getUserDeals(String userId) {
    return _dealCollection.where('userId', isEqualTo: userId).snapshots();
  }

  @override
  Future<String> postDeal(Deal deal) async {
    try {
      DocumentReference reference = await _dealCollection.add(deal.toJson());
      return reference.id;
    } catch (e) {
      print("Error occurred creating deal");
      throw e;
    }
  }
}
