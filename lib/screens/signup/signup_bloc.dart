import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peer2peer/services/authentication_api.dart';
import 'package:peer2peer/services/models/authentication_message.dart';

class SignUpBloc {
  final AuthenticationService authenticationService;

  String _email = '';
  bool _emailValid = false;

  String _password = '';
  bool _passwordValid = false;

  String _confirmedPassword = '';
  bool _confirmedPasswordValid = false;

  final StreamController<String> _emailController =
  StreamController.broadcast();
  Sink<String> get emailChanged => _emailController.sink;
  Stream<String> get email => _emailController.stream;

  final StreamController<String> _passwordController =
  StreamController.broadcast();
  Sink<String> get passwordChanged => _passwordController.sink;
  Stream<String> get password => _passwordController.stream;

  final StreamController<String> _passwordConfirmationController =
  StreamController.broadcast();
  Sink<String> get passwordConfirmationChanged => _passwordController.sink;
  Stream<String> get passwordConfirmation => _passwordController.stream;

  final StreamController<bool> _enableLoginButtonController =
  StreamController.broadcast();
  Sink<bool> get enableLoginButtonChanged => _enableLoginButtonController.sink;
  Stream<bool> get enableLoginButton => _enableLoginButtonController.stream;

  SignUpBloc({required this.authenticationService}) {
    email.listen((event) {
      _email = event;
      _emailValid = true;
      _updateEnableLoginButtonStream();
    }).onError((error) {
      _email = "";
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

    passwordConfirmation.listen((event) {
      _confirmedPassword = event;
      _confirmedPasswordValid = true;
      _updateEnableLoginButtonStream();
    }).onError((error) {
      _confirmedPassword = '';
      _confirmedPasswordValid = false;
      _updateEnableLoginButtonStream();
    });


  }

  void _updateEnableLoginButtonStream() {
    if (_emailValid && _passwordValid) {
      enableLoginButtonChanged.add(true);
    } else {
      enableLoginButtonChanged.add(false);
    }
  }

  Future<String> loginEmailAndPassword() async {
    String result = '';
    if (_emailValid && _passwordValid) {
      await authenticationService
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((AuthenticationMessage message) {
        result = 'Created user: $message';
      });
    } else {
      return 'Login Password and Email is required';
    }
    return result;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _passwordConfirmationController.close();
    _enableLoginButtonController.close();
  }
}
