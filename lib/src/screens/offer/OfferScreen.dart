import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/widgets/labeled_text_input.dart';

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
                  LabeledTextInput(
                    hint: "From Amount",
                    onChange: (String value) {},
                    label: "From",
                  ),
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
                  LabeledTextInput(
                    hint: "To Amount",
                    onChange: (String value) {},
                    label: "To",
                  ),
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
