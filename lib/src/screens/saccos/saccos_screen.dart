import 'package:flutter/material.dart';

class SaccosScreen extends StatefulWidget {
  static const SACCOS_SCREEN_ROUTE = "/saccos_screen";

  const SaccosScreen({Key? key}) : super(key: key);

  @override
  _SaccosScreenState createState() => _SaccosScreenState();

  static void goToSaccoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SACCOS_SCREEN_ROUTE);
  }
}

class _SaccosScreenState extends State<SaccosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving Sacco Groups"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListView();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
