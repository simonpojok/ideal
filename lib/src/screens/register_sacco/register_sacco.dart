import 'package:flutter/material.dart';

class RegisterSaccoScreen extends StatefulWidget {
  static const REGISTER_SACCO_SCREEN = "/register_sacco";

  const RegisterSaccoScreen({Key? key}) : super(key: key);

  @override
  _RegisterSaccoScreenState createState() => _RegisterSaccoScreenState();
  static void goToRegisterSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(REGISTER_SACCO_SCREEN);
  }
}

class _RegisterSaccoScreenState extends State<RegisterSaccoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Sacco"),
      ),
    );
  }
}
