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
                height: height * .80,
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: kPrimaryTextColor.withOpacity(.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
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
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  '19',
                                  style: TextStyle(color: kPrimaryTextColor),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: kPrimaryDarkColor,
                                size: kDefaultPadding * 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  '19',
                                  style: TextStyle(color: kPrimaryTextColor),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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

class BorrowRequestCard extends StatelessWidget {
  const BorrowRequestCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Stack(
        clipBehavior: Clip.none,
        // alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.circular(20)),
              height: size.width * .2,
              width: size.width * .3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: size.width * .008, left: size.width * .008),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: size.height * .15,
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: kPrimaryTextColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                'Adam M',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color:
                                            kPrimaryDarkColor.withOpacity(0.8)),
                              ),
                              decoration: BoxDecoration(
                                  color: kPrimaryLightColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Divider(
                              height: 1,
                            ),
                            Text('Adam M. would like to borrow')
                          ],
                        )
                      ],
                    ),
                    Text(
                      'Payment History',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.orange,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5.0,
            right: -5.0,
            child: Container(
              height: 40,
              width: 70,
              child: Center(
                child: Text(
                  'Offer',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kPrimaryTextColor, fontSize: 16),
                ),
              ),
              decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
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
    double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
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
