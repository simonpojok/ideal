import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotificationsBanner extends StatelessWidget {
  const NotificationsBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}