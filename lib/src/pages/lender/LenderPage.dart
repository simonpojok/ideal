import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/pages/lender/widgets/price_indicator.dart';

class LenderPage extends StatefulWidget {
  const LenderPage({Key? key}) : super(key: key);

  @override
  _LenderPageState createState() => _LenderPageState();
}

class _LenderPageState extends State<LenderPage> {
  double price = 100000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                child: RichText(
                  text: TextSpan(
                    text:
                        'Please drag the pointer through the bar to indicate how much',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: kLightBlue, fontSize: 16),
                    children: [
                      TextSpan(
                          text: ' Money',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: kColorOrange)),
                      TextSpan(text: ' you want to offer'),
                      TextSpan(
                        text: ' Adam M.',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kColorOrange,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceIndicator(
                    price: '450, 000',
                    color: kColorOrange,
                  ),
                  PriceIndicator(
                    price: '550, 000',
                    color: kLightBlue,
                  ),
                ],
              ),
              Slider(
                min: 100000,
                max: 500000.0,
                value: price,
                label: "$price",
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    price = value;
                  });
                },
              ),
              Row(
                children: [
                  Text("Amounts: ", style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: kLightBlue,
                  ),),
                  PriceIndicator(price: "$price", color: kGreenColor)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
