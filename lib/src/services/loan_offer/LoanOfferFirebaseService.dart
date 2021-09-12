import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal/src/models/loan_offer.dart';
import 'package:ideal/src/services/loan_offer/LoanOfferApi.dart';

class FirebaseLoanOfferService implements LoanOfferApi {
  final _loanOfferCollection =
      FirebaseFirestore.instance.collection("loan_offers");

  @override
  Future<String> createLoanOffer(LoanOffer loanOffer) async {
    try {
      DocumentReference reference =
          await _loanOfferCollection.add(loanOffer.toJson());
      return reference.id;
    } catch (e) {
      print("Error Creating Loan Offer");
      print(e);
    }

    return "";
  }

  @override
  Stream<QuerySnapshot<Object?>> getCurrentLocationLoanOffers() {
    // TODO: implement getCurrentLocationLoanOffers
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Object?>> getLoanOffers() {
    return _loanOfferCollection.snapshots();
  }

  @override
  Stream<QuerySnapshot<Object?>> getUserLoanOffers() {
    // TODO: implement getUserLoanOffers
    throw UnimplementedError();
  }
}
