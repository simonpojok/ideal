import 'package:flutter/cupertino.dart';
import 'package:ideal/src/blocs/deal/DealBloc.dart';

class DealBlocProvider extends InheritedWidget {
  final DealBloc dealBloc;

  DealBlocProvider({Key? key, required Widget child, required this.dealBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant DealBlocProvider oldWidget) =>
      dealBloc != oldWidget.dealBloc;

  static DealBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DealBlocProvider>()
        as DealBlocProvider;
  }
}
