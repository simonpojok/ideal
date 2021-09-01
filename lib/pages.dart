import 'package:flutter/material.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/signup/SignUpScreen.dart';
import 'package:ideal/src/screens/welcome/WelcomeScreen.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  if (settings.name == LoginScreen.LOGIN_SCREEN_ROUTE) {
    return MaterialPageRoute(builder: (context) => LoginScreen());
  }

  if (settings.name == SignUpScreen.SIGNUP_SCREEN_ROUTE) {
    return MaterialPageRoute(builder: (builder) => SignUpScreen());
  }

  if (settings.name == DashboardScreen.DASHBOARD_ROUTE) {
    return MaterialPageRoute(builder: (context) => DashboardScreen());
  }

  return MaterialPageRoute(builder: (context) => WelcomeScreen());
}
