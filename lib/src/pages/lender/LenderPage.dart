import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/pages/lender/widgets/custom_slider.dart';
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
                RectangularButton(size: size),
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

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.blue,
        elevation: 4,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SummeryDialog();
              },
            );
          },
          child: Container(
            height: 50,
            width: size.width * .8,
            child: Center(
              child: Text(
                "Make offer",
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SummeryDialog extends StatelessWidget {
  const SummeryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please confirm your offer and that you will be able to back",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "600,000",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: " UGX",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.orangeAccent,
                                    fontSize: 18,
                                  ),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder.all(color: Colors.black12),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    HeaderTableCell(
                      label: "Amount",
                    ),
                    HeaderTableCell(
                      label: "Duration",
                    ),
                    HeaderTableCell(
                      label: "Interest",
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    DataTableCell(
                      amount: "450, 000",
                      units: "UGX",
                    ),
                    DataTableCell(
                      amount: "2",
                      units: "Months",
                    ),
                    DataTableCell(
                      amount: "6",
                      units: "%",
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.blue.withOpacity(.4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    onSurface: Colors.blue.withOpacity(.4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DataTableCell extends StatelessWidget {
  final String amount;
  final String units;
  const DataTableCell({
    Key? key,
    required this.amount,
    required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RichText(
        text: TextSpan(
          text: amount,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.orangeAccent,
                fontSize: 16,
              ),
          children: [
            TextSpan(
              text: " $units",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderTableCell extends StatelessWidget {
  final String label;
  const HeaderTableCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
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
