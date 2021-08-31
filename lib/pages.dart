import 'package:flutter/material.dart';
import 'package:ideal/src/screens/welcome/WelcomeScreen.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => WelcomeScreen());
}
