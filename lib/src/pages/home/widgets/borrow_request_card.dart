import 'package:flutter/material.dart';

import '../../../constants.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    'Adam M',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: kPrimaryDarkColor
                                                .withOpacity(0.8)),
                                  ),
                                  decoration: BoxDecoration(
                                      color:
                                          kPrimaryLightColor.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Divider(),
                                Text('Adam M. would like to borrow')
                              ],
                            ),
                          )
                        ],
                      ),
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
            bottom: 0.0,
            right: 0.0,
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
