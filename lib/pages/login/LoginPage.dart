import 'package:flutter/material.dart';
import 'package:ideal/pages/login/LoginBloc.dart';
import 'package:ideal/services/AuthenticationService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;


  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationApi: AuthenticationService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
