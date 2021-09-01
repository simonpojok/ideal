import 'package:flutter/material.dart';

class LoanCalculatorScreen extends StatefulWidget {
  static const LOAN_CALCULATOR_ROUTE = "/loan_calculator_route";

  const LoanCalculatorScreen({Key? key}) : super(key: key);

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();

  static void goToLoanCalculator(BuildContext context) {
    Navigator.of(context).pushNamed(LOAN_CALCULATOR_ROUTE);
  }
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Calculator"),
      ),
    );
  }
}
