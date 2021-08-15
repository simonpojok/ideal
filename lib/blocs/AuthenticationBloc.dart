import 'dart:async';

import 'package:peer2peer/services/authentication_api.dart';

class AuthenticationBloc {
  final AuthenticationService authenticationService;
  final StreamController<String> _authenticationController = StreamController<String>();

  Sink<String> get addUser => _authenticationController.sink;
  Stream<String> get user => _authenticationController.stream;

  final StreamController<bool> _logoutController = StreamController<bool>();
  Sink<bool> get logoutUser => _logoutController.sink;
  Stream<bool> get listLogoutUser => _logoutController.stream;

  AuthenticationBloc(this.authenticationService) {
    onAuthChanged();
  }

  void onAuthChanged() {
  }


}