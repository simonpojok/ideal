import 'package:flutter/material.dart';
import 'package:ideal/src/blocs/deal/DealBlocProvider.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/screens/deal/deal_detail.dart';
import 'package:ideal/src/screens/deal_create/create_deal_screen.dart';
import 'package:ideal/src/screens/widgets/stream_loading_indicator.dart';

const description =
    "The term loan refers to a type of credit vehicle in which a sum of money is lent to another party in exchange for future repayment of the value or principal amount. In many cases, the offers also adds interest and/or finance charges to the principal value which the borrower must repay in addition to the principal balance. Loans may be for a specific, one-time amount, or they may be available as an open-ended line of credit up to a specified limit. Loans come in many different forms including secured, unsecured, commercial, and personal loans.";

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
    final service = DealBlocProvider.of(context).dealBloc.dealApi;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                size: 25,
                color: Theme.of(context).primaryTextTheme.bodyText1!.color,
              ),
              hintText: "Search deals",
              hintStyle: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Colors.white12,
                  ),
            ),
            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              CreateDealScreen.goToCreateDealScreen(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: service.getDeals(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      // LoanOffer offer =
                      // LoanOffer.fromJson(snapshot.data.docs[index].data());
                      // return LoanOfferItemCard(
                      //   offer: offer,
                      // );
                      return DealListTile();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 1,
                      );
                    },
                  );
                }
                return StreamLoadingIndicator();
              },
              itemCount: 30,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                );
              },
            );
          }),
    );
  }
}

class DealListTile extends StatelessWidget {
  const DealListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {DealScreen.goToDealScreen(context)},
      contentPadding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * .5,
      ),
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Simon Ojok",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: Colors.black45,
                    ),
                    Text(
                      "Masaka",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                    )
                  ],
                )
              ],
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
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "3,000, 000\t\t",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          TextSpan(
                            text: "UGX",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DealActionChip(
                  iconData: Icons.email,
                  onPress: () {},
                  count: 10,
                ),
                DealActionChip(
                  iconData: Icons.visibility,
                  onPress: () {},
                  count: 30,
                ),
                DealActionChip(
                  iconData: Icons.monetization_on_outlined,
                  onPress: () {},
                  count: 1,
                ),
                DealActionChip(
                  count: 3,
                  iconData: Icons.share,
                  onPress: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DealActionChip extends StatelessWidget {
  final IconData iconData;
  final int count;
  final VoidCallback onPress;
  const DealActionChip({
    Key? key,
    required this.iconData,
    required this.count,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          child: InkWell(
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding * .4),
                    child: Text(
                      "$count",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
