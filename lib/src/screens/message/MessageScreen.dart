import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/message.dart';
import 'package:ideal/src/models/user.dart';
import 'package:ideal/src/screens/message/widgets/message_item.dart';
import 'package:ideal/src/screens/message/widgets/send_message.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    int prevUserId = -1;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: messages[0].sender.name,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
            children: [
              TextSpan(text: "\n"),
              TextSpan(
                text: 'Online',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.greenAccent,
                    ),
              )
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * .5),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    final bool isSameUser = prevUserId == message.sender.id;
                    prevUserId = message.sender.id;
                    return ChatMessageItem(
                      isMe: isMe,
                      isSameUser: isSameUser,
                      message: message,
                    );
                  },
                ),
              ),
            ),
            SendMessage(),
          ],
        ),
      ),
    );
  }
}
