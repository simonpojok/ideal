import 'package:flutter/material.dart';

class DealsScreen extends StatefulWidget {
  static const DEALS_SCREEN = "/DealsListScreen";

  static const DEALS_LIST_KEY = ValueKey("DealsListScreen");
  const DealsScreen({Key? key}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();

  static void goToDealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(DEALS_SCREEN);
  }
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deals"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile();
        },
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
