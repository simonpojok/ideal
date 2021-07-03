import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/borrow_request_card.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/notifications_banner.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        leading: Center(
          child: Text(
            'Logo',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kPrimaryTextColor),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        centerTitle: true,
        title: Text('DASHBOARD'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashboardHeader(),
              Container(
                height: height * .75,
                padding: EdgeInsets.all(kDefaultPadding * .8),
                decoration: BoxDecoration(
                  color: kPrimaryTextColor.withOpacity(.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    NotificationsBanner(),
                    Flexible(
                      child: ListView.builder(
                        itemCount: 30,
                        itemBuilder: (context, index) => BorrowRequestCard(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
