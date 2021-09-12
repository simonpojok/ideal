import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

class OfferScreen extends StatefulWidget {
  static const OFFER_SCREEN_ROUTE = '/offer_screen';
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();

  static void goToOfferScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OFFER_SCREEN_ROUTE);
  }
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish Load Offer"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: kDefaultPadding * .5,
            right: kDefaultPadding * .5,
            top: kDefaultPadding * .5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding * .5,
                ),
                child: Text(
                  "Loan Range",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        color: Colors.black45,
                      ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RangePriceInput(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * .5,
                    ),
                    child: Center(
                      child: Text(
                        "To",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              color: Colors.black45,
                            ),
                      ),
                    ),
                  ),
                  RangePriceInput(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangePriceInput extends StatelessWidget {
  const RangePriceInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding * .5,
            ),
            child: Text(
              "Loan Range",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.black12,
            ),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                  color: Colors.black45,
                ),
          ),
        ],
      ),
    ));
  }
}
