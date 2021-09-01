import 'package:flutter/material.dart';

import '../../../constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 1.5,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
            child: Text(
              "OR",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
