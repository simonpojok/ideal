import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/deal_model.dart';
import 'package:ideal/src/services/deal/DealApi.dart';

class DealBloc {
  final DealApi dealApi;

  DealBloc({required this.dealApi});

  Future<String> postDeal(Deal deal) {
    return dealApi.postDeal(deal);
  }

  Stream<QuerySnapshot> deals() {
    return dealApi.getDeals();
  }

  Stream<QuerySnapshot> userDeals(String userId) {
    return dealApi.getUserDeals(userId);
  }
}
