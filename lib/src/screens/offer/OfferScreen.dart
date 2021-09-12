import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  static const OFFER_SCREEN_ROUTE = '/offer_screen';
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();

  void goToOfferScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OFFER_SCREEN_ROUTE);
  }
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
