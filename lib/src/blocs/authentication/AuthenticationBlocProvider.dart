import 'package:flutter/cupertino.dart';
import 'package:ideal/src/blocs/authentication/AuthenticationBloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc bloc;

  AuthenticationBlocProvider(
      {Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant AuthenticationBlocProvider oldWidget) =>
      bloc != oldWidget.bloc;

  static AuthenticationBlocProvider of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<AuthenticationBlocProvider>()
        as AuthenticationBlocProvider;
  }
}
