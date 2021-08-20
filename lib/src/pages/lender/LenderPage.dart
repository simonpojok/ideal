import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class LenderPage extends StatefulWidget {
  const LenderPage({Key? key}) : super(key: key);

  @override
  _LenderPageState createState() => _LenderPageState();
}

class _LenderPageState extends State<LenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("LOGO"),
                    Text(
                      "REQUESTS",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kLightBlue, fontSize: 18),
                    ),
                    Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kColorOrange, fontSize: 18),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(
                    text: 'Please drag the pointer through the bar to indicate how much',
                    children: [
                      TextSpan(
                        text: 'Money'
                      ),
                      TextSpan(
                        text: ' you want to offer'
                      ),
                      TextSpan(
                        text: ' Adam M.'
                      )
                    ]
                  ),
              ),
              Row(
                children: [
                  Text("450,000 ugx"),
                  Text("450,000 ugx"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
