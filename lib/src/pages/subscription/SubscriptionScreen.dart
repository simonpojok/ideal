import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/pages/widgets/rectangular_button.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscriptions"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SubscriptionCard(),
              RectangularButton(
                onTap: () {},
                label: "Continue",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: RadioListTile(
        groupValue: 0,
        onChanged: (value) {},
        value: 5,
        title: Text("Bronze 550,000 ugx"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Loan Limit",
                children: [
                  TextSpan(text: "250, 000"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
