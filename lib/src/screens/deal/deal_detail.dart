import 'package:flutter/material.dart';

class DealScreen extends StatefulWidget {
  static const DEAL_SCREEN_ROUTE = "/deal_screen";
  const DealScreen({Key? key}) : super(key: key);

  @override
  _DealScreenState createState() => _DealScreenState();

  static void goToDealScreen(BuildContext context) {
    Navigator.of(context).pushNamed(DEAL_SCREEN_ROUTE);
  }
}

class _DealScreenState extends State<DealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
