import 'package:flutter/material.dart';

import '../../constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardHeader(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: kPrimaryTextColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Requests'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.message,
                                color: kPrimaryDarkColor,
                                size: kDefaultPadding * 2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: kPrimaryDarkColor,
                                size: kDefaultPadding * 2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.tune,
                                color: kPrimaryDarkColor,
                                size: kDefaultPadding * 2,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: size.height * .12,
          bottom: kDefaultPadding * 1.5),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: kPrimaryTextColor, fontSize: 17),
        decoration: InputDecoration(
            hintText: 'Create a new loan banner',
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: kPrimaryTextColor.withOpacity(0.5), fontSize: 17),
            suffixIcon: Icon(
              Icons.navigate_next,
              color: kPrimaryTextColor,
            )),
      ),
      decoration: BoxDecoration(
        color: kPrimaryDarkColor,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
