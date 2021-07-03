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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.circle),
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
    );
  }
}