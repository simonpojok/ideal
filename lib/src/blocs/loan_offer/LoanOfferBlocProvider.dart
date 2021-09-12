import 'package:flutter/cupertino.dart';
import 'package:ideal/src/blocs/loan_offer/LoanOfferBloc.dart';

class LoanOfferBlocProvider extends InheritedWidget {
  final LoanOfferBloc loanOfferBloc;

  LoanOfferBlocProvider(
      {Key? key, required Widget child, required this.loanOfferBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant LoanOfferBlocProvider oldWidget) =>
      loanOfferBloc != oldWidget.loanOfferBloc;

  static LoanOfferBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanOfferBlocProvider>()
        as LoanOfferBlocProvider;
  }
}
