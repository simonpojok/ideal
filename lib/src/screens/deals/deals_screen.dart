import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';

const description =
    "The term loan refers to a type of credit vehicle in which a sum of money is lent to another party in exchange for future repayment of the value or principal amount. In many cases, the lender also adds interest and/or finance charges to the principal value which the borrower must repay in addition to the principal balance. Loans may be for a specific, one-time amount, or they may be available as an open-ended line of credit up to a specified limit. Loans come in many different forms including secured, unsecured, commercial, and personal loans.";

class DealsScreen extends StatefulWidget {
  static const DEALS_SCREEN = "/DealsListScreen";

  static const DEALS_LIST_KEY = ValueKey("DealsListScreen");
  const DealsScreen({Key? key}) : super(key: key);

  @override
  _DealsScreenState createState() => _DealsScreenState();

  static void goToDealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(DEALS_SCREEN);
  }
}

class _DealsScreenState extends State<DealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deals"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * .5,
            ),
            title: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Simon Peter Ojok",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    "12-06-2023",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
            ),
            subtitle: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.black45,
                          fontSize: 16,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: kDefaultPadding * .4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "3,000, 000\t\t",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                TextSpan(
                                  text: "UGX",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.orange,
                                        fontSize: 15,
                                      ),
                                )
                              ]),
                        ),
                        Chip(
                          label: const Text('16% Monthly'),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   color: Colors.greenAccent,
                  // )
                ],
              ),
            ),
          );
        },
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
          );
        },
      ),
    );
  }
}
