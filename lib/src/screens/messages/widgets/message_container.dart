import 'package:flutter/material.dart';
import 'package:ideal/src/models/message.dart';

import '../../../constants.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final Message chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      onTap: () {},
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(chat.sender.imageUrl),
          ),
          if (chat.sender.isOnline)
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            chat.sender.name,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            chat.time,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
          )
        ],
      ),
      subtitle: Container(
        margin: EdgeInsets.only(top: kDefaultPadding * 0.5),
        child: Text(
          chat.text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 13, color: Colors.black54),
          overflow: TextOverflow.clip,
          maxLines: 2,
        ),
      ),
    );
  }
}
