import 'package:flutter/material.dart';
import 'package:ideal/src/screens/calc/loan_calculator.dart';
import 'package:ideal/src/screens/dashboard/DashboardScreen.dart';
import 'package:ideal/src/screens/deal/deal_detail.dart';
import 'package:ideal/src/screens/deals/deals_screen.dart';
import 'package:ideal/src/screens/login/LoginScreen.dart';
import 'package:ideal/src/screens/message/MessageScreen.dart';
import 'package:ideal/src/screens/messages/MessagesScreen.dart';
import 'package:ideal/src/screens/offers/offers_screen.dart';
import 'package:ideal/src/screens/sacco/SaccoScreen.dart';
import 'package:ideal/src/screens/saccos/saccos_screen.dart';
import 'package:ideal/src/screens/signup/SignUpScreen.dart';
import 'package:ideal/src/screens/welcome/WelcomeScreen.dart';

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  print("${settings.name} arguments ${settings.arguments}");
  switch (settings.name) {
    case LoginScreen.LOGIN_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      }

    case SignUpScreen.SIGNUP_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (builder) => SignUpScreen());
      }

    case DashboardScreen.DASHBOARD_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      }

    case MessagesScreen.MESSAGE_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => MessagesScreen());
      }

    case MessageScreen.MESSAGE_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => MessageScreen());
      }

    case DealsScreen.DEALS_SCREEN:
      {
        return MaterialPageRoute(builder: (context) => DealsScreen());
      }

    case DealScreen.DEAL_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => DealScreen());
      }

    case SaccosScreen.SACCOS_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => SaccosScreen());
      }

    case SaccoScreen.SACCO_SCREEN_ROUTE:
      {
        return MaterialPageRoute(builder: (context) => SaccoScreen());
      }
    case OffersScreen.OFFERS_SCREEN_ROUTE:
      {
        return MaterialPageRoute(
            builder: (BuildContext context) => OffersScreen());
      }

    case LoanCalculatorScreen.LOAN_CALCULATOR_ROUTE:
      {
        return MaterialPageRoute(
            builder: (BuildContext context) => LoanCalculatorScreen());
      }

    default:
      {
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      }
  }
}
