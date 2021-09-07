import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/sacco/SaccoBloc.dart';

class SaccoBlocProvider extends InheritedWidget {
  final SaccoBloc saccoBloc;

  static SaccoBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SaccoBlocProvider>()
        as SaccoBlocProvider;
  }

  SaccoBlocProvider({Key? key, required Widget child, required this.saccoBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant SaccoBlocProvider oldWidget) =>
      saccoBloc != oldWidget.saccoBloc;
}
