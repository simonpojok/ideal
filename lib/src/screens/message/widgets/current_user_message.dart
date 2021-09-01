import 'package:flutter/material.dart';
import 'package:ideal/src/models/message.dart';

class CurrentUserMessage extends StatelessWidget {
  const CurrentUserMessage({
    Key? key,
    required this.message,
    required this.isSameUser,
  }) : super(key: key);

  final Message message;
  final bool isSameUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.80,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (!isSameUser)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
