import 'package:flutter/material.dart';
import 'package:ideal/src/screens/login/LoginPage.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => LoginPage());
}
