import 'dart:async';

import 'package:peer2peer/services/authentication_api.dart';

class LoginBloc {
  final AuthenticationService authenticationService;
  String _email = '';
  String _password = '';
  bool _emailValid = false;
  bool _passwordValid = false;


  final StreamController<String> _emailController = StreamController.broadcast();
  Sink<String> get emailChanged => _emailController.sink;
  Stream<String> get email => _emailController.stream;

  final StreamController<String> _passwordController = StreamController.broadcast();
  Sink<String> get passwordChanged => _passwordController.sink;
  Stream<String> get password => _passwordController.stream;

  final StreamController<bool> _enableLoginButtonController = StreamController.broadcast();
  Sink<bool> get enableLoginButtonChanged => _enableLoginButtonController.sink;
  Stream<bool> get enableLoginButton => _enableLoginButtonController.stream;

  LoginBloc({required this.authenticationService}) {
    email.listen((event) {
      _email = event;
      _emailValid = true;
      _updateEnableLoginButtonStream();
    }).onError((error) {
      _email = '';
      _emailValid = false;
      _updateEnableLoginButtonStream();
    });

    password.listen((event) {
      _password = event;
      _passwordValid = true;
      _updateEnableLoginButtonStream();
    }).onError((error) {
      _password = '';
      _passwordValid = false;
      _updateEnableLoginButtonStream();
    });
  }

  void _updateEnableLoginButtonStream(){
    if (_emailValid && _passwordValid) {
      enableLoginButtonChanged.add(true);
    } else {
      enableLoginButtonChanged.add(false);
    }
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _enableLoginButtonController.close();
  }

  Future<String> login() async {
    String result = '';
    if (_emailValid && _passwordValid) {
      await authenticationService.createUserWithEmailAndPassword(email: _email, password: _password)
          .then((String uid) {
            result = 'Created user: $uid';
      });
    } else {
      return 'Login Password and Email is required';
    }
    return result;
  }
}