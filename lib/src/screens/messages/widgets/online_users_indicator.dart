import 'package:flutter/material.dart';

class UserOnlineIndicator extends StatelessWidget {
  final bool isOnLine;
  const UserOnlineIndicator({Key? key, required this.isOnLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOnLine
        ? Container(
            margin: const EdgeInsets.only(left: 5),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
          )
        : Container(
            child: null,
          );
  }
}
