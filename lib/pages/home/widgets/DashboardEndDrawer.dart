import 'package:flutter/material.dart';

import '../../../constants.dart';

class DashboardEndDrawer extends StatelessWidget {
  const DashboardEndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: kPrimaryTextColor,
      padding: EdgeInsets.all(kDefaultPadding),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('LOGO'),
                Builder(
                  builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.orange,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
                Text(
                  'Johnbosco P'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: kPrimaryDarkColor, fontSize: 20),
                ),
              ],
            ),
            Text('Accounting ID'),
            Text('45DJDJD7D73NDBST3LDMSBS', style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.orange, fontSize: 18),),
            Container(
              color: Colors.grey,
              child: Text('Hello world'),
            ),
            Text(
              'FAQs',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kPrimaryColor, fontSize: 18),
            ),
            Text(
              'Sign Out',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kPrimaryColor, fontSize: 18),
            ),
            Text(
              'Delete Account',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.orange, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
