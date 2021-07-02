import 'dart:async';

import 'package:peer2peer/services/authentication_api.dart';

class LoginBloc {
  final AuthenticationService authenticationService;

  final StreamController<String> _emailController = StreamController.broadcast();
  Sink<String> get emailChanged => _emailController.sink;
  Stream<String> get email => _emailController.stream;

  final StreamController<String> _passwordController = StreamController.broadcast();
  Sink<String> get passwordChanged => _passwordController.sink;
  Stream<String> get password => _passwordController.stream;


  LoginBloc({required this.authenticationService});

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}