import 'package:flutter/material.dart';
import 'package:ideal/src/models/message.dart';

import 'current_user_message.dart';

class ChatMessageItem extends StatelessWidget {
  final bool isMe;
  final bool isSameUser;
  final Message message;
  const ChatMessageItem(
      {Key? key,
      required this.isMe,
      required this.isSameUser,
      required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return CurrentUserMessage(message: message, isSameUser: isSameUser);
    } else {
      return SenderUserMessage(message: message, isSameUser: isSameUser);
    }
  }
}

class SenderUserMessage extends StatelessWidget {
  const SenderUserMessage({
    Key? key,
    required this.message,
    required this.isSameUser,
  }) : super(key: key);

  final Message message;
  final bool isSameUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.topLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.80,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
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
                color: Colors.black54,
              ),
            ),
          ),
        ),
        if (!isSameUser)
          Row(
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            ],
          )
      ],
    );
  }
}
