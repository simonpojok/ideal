import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/deal_model.dart';

abstract class DealApi {
  Future<String> postDeal(Deal deal);
  Stream<QuerySnapshot> getUserDeals(String userId);
  Stream<QuerySnapshot> getDeals();
}
