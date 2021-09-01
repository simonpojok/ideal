import 'package:flutter/material.dart';

class SaccoScreen extends StatefulWidget {
  static const SACCO_SCREEN_ROUTE = "/sacco_screen";

  const SaccoScreen({Key? key}) : super(key: key);

  @override
  _SaccoScreenState createState() => _SaccoScreenState();

  static void goToSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SACCO_SCREEN_ROUTE);
  }
}

class _SaccoScreenState extends State<SaccoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
