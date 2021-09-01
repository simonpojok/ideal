import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/offers/widgets/custom_slider.dart';
import 'package:ideal/src/screens/offers/widgets/information_dialog.dart';
import 'package:ideal/src/screens/offers/widgets/price_indicator.dart';
import 'package:ideal/src/screens/widgets/rectangular_button.dart';

class LenderPage extends StatefulWidget {
  const LenderPage({Key? key}) : super(key: key);

  @override
  _LenderPageState createState() => _LenderPageState();
}

class _LenderPageState extends State<LenderPage> {
  double price = 100000;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("REQUESTS"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'Please drag the pointer through the bar to indicate how much',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                      children: [
                        TextSpan(
                          text: ' Money',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                  ),
                        ),
                        TextSpan(text: ' you want to offer'),
                        TextSpan(
                          text: ' Adam M.',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriceIndicator(
                        price: '10, 000',
                        color: kColorOrange,
                      ),
                      PriceIndicator(
                        price: '500, 000',
                        color: kLightBlue,
                      ),
                    ],
                  ),
                ),
                CustomSlider(
                  min: 10000,
                  max: 500000,
                  value: price,
                  divisions: 50,
                  onChanged: (double price) {
                    setState(
                      () {
                        this.price = price;
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Amounts: ",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: kLightBlue,
                            ),
                      ),
                      PriceIndicator(price: "$price", color: kGreenColor)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 2),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                      text:
                          "Please drag the point through the bar to indicate how much ",
                      children: [
                        TextSpan(
                          text: " Payback period ",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                    fontSize: 16,
                                  ),
                        ),
                        TextSpan(text: "you want to offer "),
                        TextSpan(
                          text: "Adam M.",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                    fontSize: 16,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckBox(
                        label: "Weeks",
                        checked: true,
                        onClick: (bool? value) {},
                      ),
                      CustomCheckBox(
                        label: "Months",
                        checked: false,
                        onClick: (bool? value) {},
                      ),
                      CustomCheckBox(
                        label: "Years",
                        checked: false,
                        onClick: (bool? value) {},
                      ),
                    ],
                  ),
                ),
                CustomSlider(
                  min: 5,
                  max: 20,
                  value: 10,
                  divisions: 2,
                  onChanged: (double price) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 2),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                      text:
                          "Please drag the point through the bar to indicator how much ",
                      children: [
                        TextSpan(
                          text: " Interest ",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                    fontSize: 16,
                                  ),
                        ),
                        TextSpan(text: " you want to offer "),
                        TextSpan(
                          text: "Adam M.",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kColorOrange,
                                    fontSize: 16,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                CustomSlider(
                  min: 1,
                  max: 100,
                  value: 10,
                  divisions: 100,
                  onChanged: (double price) {},
                ),
                SizedBox(
                  height: 20,
                ),
                RectangularButton(
                  label: "Make Offer",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SummeryDialog();
                      },
                    );
                  },
                  color: Colors.deepOrangeAccent,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final String label;
  final checked;
  final Function(bool? value) onClick;
  const CustomCheckBox({
    Key? key,
    required this.label,
    this.checked,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: onClick,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
