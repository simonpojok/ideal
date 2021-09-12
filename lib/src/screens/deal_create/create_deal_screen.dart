import 'package:flutter/material.dart';

class CreateDealScreen extends StatefulWidget {
  static const CREATE_DEAL_SCREEN_ROUTE = "/create_deal_screen_route";

  const CreateDealScreen({Key? key}) : super(key: key);

  @override
  _CreateDealScreenState createState() => _CreateDealScreenState();

  static void goToCreateDealScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CREATE_DEAL_SCREEN_ROUTE);
  }
}

class _CreateDealScreenState extends State<CreateDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
