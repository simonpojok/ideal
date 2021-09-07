import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/sacco/SaccoBloc.dart';

class SaccoRegistrationBlocProvider extends InheritedWidget {
  final SaccoRegistrationBloc saccoRegistrationBloc;

  SaccoRegistrationBlocProvider(
      {Key? key, required Widget child, required this.saccoRegistrationBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
