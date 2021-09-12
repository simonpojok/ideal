import 'package:flutter/material.dart';

class MySaccoGroupScreen extends StatefulWidget {
  static const MY_SACCO_GROUP_ROUTE = '/my_sacco_group';
  const MySaccoGroupScreen({Key? key}) : super(key: key);

  @override
  _MySaccoGroupScreenState createState() => _MySaccoGroupScreenState();
  static void goToMySaccoGroupScreen(BuildContext context) {
    Navigator.of(context).pushNamed(MY_SACCO_GROUP_ROUTE);
  }
}

class _MySaccoGroupScreenState extends State<MySaccoGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
