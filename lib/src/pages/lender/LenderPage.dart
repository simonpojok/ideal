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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PriceIndicator extends StatelessWidget {
  final String price;
  final Color color;
  const PriceIndicator({
    Key? key,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: price,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: color, fontSize: 18, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: ' ugx',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.normal, color: color),
          ),
        ],
      ),
    );
  }
}
