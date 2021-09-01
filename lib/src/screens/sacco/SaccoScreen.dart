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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * .3,
                width: double.infinity,
                color: Colors.greenAccent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
