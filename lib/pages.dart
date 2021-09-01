import 'package:flutter/material.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/welcome/WelcomeScreen.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  if (settings.name == LoginScreen.LOGIN_SCREEN_ROUTE) {
    return MaterialPageRoute(builder: (context) => LoginScreen());
  }
  return MaterialPageRoute(builder: (context) => WelcomeScreen());
}
