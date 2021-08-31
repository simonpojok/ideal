import 'package:flutter/material.dart';

class DealsListScreen extends StatefulWidget {
  static const DEALS_LIST_KEY = ValueKey("DealsListScreen");
  const DealsListScreen({Key? key}) : super(key: key);

  @override
  _DealsListScreenState createState() => _DealsListScreenState();
}

class _DealsListScreenState extends State<DealsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deals"),
      ),
    );
  }
}
