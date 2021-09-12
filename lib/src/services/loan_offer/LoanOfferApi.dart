import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/loan_offer.dart';

abstract class LoanOfferApi {
  Future<String> createLoanOffer(LoanOffer loanOffer);

  Stream<QuerySnapshot> getLoanOffers();

  Stream<QuerySnapshot> getUserLoanOffers();

  Stream<QuerySnapshot> getCurrentLocationLoanOffers();
}
