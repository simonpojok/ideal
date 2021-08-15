import 'package:flutter/material.dart';
import 'package:ideal/src/pages/home/widgets/borrow_request_card.dart';
import 'package:ideal/src/pages/home/widgets/dashboard_header.dart';
import 'package:ideal/src/pages/home/widgets/notifications_banner.dart';

import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
