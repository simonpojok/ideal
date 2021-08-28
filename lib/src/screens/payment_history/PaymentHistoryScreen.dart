import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding * .5),
                child: Row(
                  children: [
                    ProfileSummeryCard(),
                    SizedBox(width: 10),
                    ProfileSummeryCard(),
                    SizedBox(width: 10),
                    ProfileSummeryCard(),
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

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "100%",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.deepOrange,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Payment Status",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
