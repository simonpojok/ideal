import 'package:flutter/material.dart';
import 'package:ideal/src/models/deal_model.dart';
import 'package:ideal/src/screens/deal/deal_detail.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../deals_screen.dart';
import 'deal_chip.dart';

class DealListTile extends StatelessWidget {
  final Deal deal;
  const DealListTile({
    Key? key,
    required this.deal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(deal.date);
    String dateTime = DateFormat("MM/dd/yyyy hh:mm a").format(date);
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
                  "${deal.user.firstName} ${deal.user.lastName}",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.orange,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
            Text(
              dateTime,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              deal.description,
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
                        text: "${deal.price}\t\t",
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
                  Flexible(child: Container()),
                  Chip(
                    label: Text('${deal.rate}%'),
                  ),
                  Chip(
                    label: Text('${deal.frequency}'),
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
                  count: deal.emails.length,
                ),
                DealActionChip(
                  iconData: Icons.visibility,
                  onPress: () {},
                  count: deal.views.length,
                ),
                DealActionChip(
                  iconData: Icons.monetization_on_outlined,
                  onPress: () {},
                  count: deal.offers.length,
                ),
                DealActionChip(
                  count: deal.sharers.length,
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