import 'package:flutter/material.dart';

import '../../../constants.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 0.3),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.file_copy_outlined),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
