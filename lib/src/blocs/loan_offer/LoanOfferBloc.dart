import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/loan_offer.dart';
import 'package:ideal/src/services/loan_offer/LoanOfferApi.dart';

class LoanOfferBloc {
  final LoanOfferApi loanOfferApi;

  LoanOfferBloc(this.loanOfferApi);

  Future<void> createLoanOffer(LoanOffer loanOffer) {
    return loanOfferApi.createLoanOffer(loanOffer);
  }

  Stream<QuerySnapshot> loanOffers() {
    return loanOfferApi.getLoanOffers();
  }
}
