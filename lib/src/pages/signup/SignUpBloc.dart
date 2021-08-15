import 'dart:async';

import 'package:ideal/src/services/AuthenticationApi.dart';
import 'package:ideal/src/validators/validator.dart';


class SignUpBloc with Validators {
  final AuthenticationApi authenticationApi;

  String _email = '';
  bool _emailValid = false;

  String _password = '';
  bool _passwordValid = false;

  String _confirmedPassword = '';
  bool _confirmedPasswordValid = false;

  final StreamController<String> _emailController =
      StreamController.broadcast();

  Sink<String> get emailChanged => _emailController.sink;

  Stream<String> get email => _emailController.stream.transform(validateEmail);

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

  SignUpBloc({required this.authenticationApi}) {
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
    String result = "";
    if (_emailValid && _passwordValid) {
      await authenticationApi
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((String uid) {
        result = "Success";
      }).catchError((error) {
        print("Login Error occurred $error");
        result = error;
      });
      return result;
    }
    return "Email and Password are invalid";
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _passwordConfirmationController.close();
    _enableLoginButtonController.close();
  }
}
