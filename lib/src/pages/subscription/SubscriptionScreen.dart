import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/pages/widgets/rectangular_button.dart';

String description =
    "Limited access to loans up to 250,000 ugx with flexible payment period not exceeding 2 weeks. Access to over 50 potential lenders and 100 borrowers per month";

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscriptions"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * .5,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SubscriptionCard(
                  name: "Bronze",
                  price: "100,000",
                  groupValue: 100000,
                  value: 100000,
                  onChange: (value) {},
                  description: description,
                  background: Colors.orangeAccent.withOpacity(0.4),
                  textColor: Colors.black38,
                ),
                SubscriptionCard(
                  name: "Silver",
                  price: "250,000",
                  groupValue: 250000,
                  value: 25000,
                  onChange: (value) {},
                  description: description,
                  background: Colors.blueGrey.withOpacity(0.4),
                  textColor: Colors.black38,
                ),
                SubscriptionCard(
                  name: "Gold",
                  price: "500,000",
                  groupValue: 200000,
                  value: 1000000,
                  onChange: (value) {},
                  description: description,
                  background: Colors.greenAccent.withOpacity(0.4),
                  textColor: Colors.black38,
                ),
                SizedBox(
                  height: 20,
                ),
                RectangularButton(
                  onTap: () {},
                  label: "Continue",
                  color: Colors.green,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String name;
  final String price;
  final int groupValue;
  final int value;
  final Function(int? value) onChange;
  final String description;
  final Color background;
  final Color textColor;
  const SubscriptionCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.groupValue,
      required this.value,
      required this.onChange,
      required this.description,
      required this.background,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: background,
      ),
      child: Stack(
        children: [
          RadioListTile(
            groupValue: groupValue,
            onChanged: onChange,
            value: value,
            title: RichText(
              text: TextSpan(
                text: name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                children: [
                  TextSpan(
                    text: "\t\t\t\t$price",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orangeAccent.withOpacity(.7),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\t\tUGX",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Read More",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
