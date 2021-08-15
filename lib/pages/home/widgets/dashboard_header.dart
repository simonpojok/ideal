import 'package:flutter/material.dart';

import '../../../constants.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notifications', style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: kPrimaryTextColor.withOpacity(.5),
                    fontSize: 13
                  ),),
                  Text('You have 3 upcoming loan payments', style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: kPrimaryTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.normal
                  ),)
                ],
              ),
            ),
            Container(
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
                        color: kPrimaryTextColor.withOpacity(0.5),
                        fontSize: 17),
                    suffixIcon: Icon(
                      Icons.navigate_next,
                      color: kPrimaryTextColor,
                    )),
              ),
              decoration: BoxDecoration(
                color: kPrimaryDarkColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
