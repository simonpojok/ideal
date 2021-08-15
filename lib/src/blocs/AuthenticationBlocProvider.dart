import 'package:flutter/material.dart';

import 'AuthenticationBloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;

  AuthenticationBlocProvider({
    Key? key, required Widget child, required this.authenticationBloc
  }) : super(key: key, child: child);

  static AuthenticationBlocProvider of(BuildContext buildContext) {
    return (buildContext.dependOnInheritedWidgetOfExactType<
        AuthenticationBlocProvider>() as AuthenticationBlocProvider);
  }

  @override
  bool updateShouldNotify(covariant AuthenticationBlocProvider oldWidget) =>
      authenticationBloc != oldWidget.authenticationBloc;

}