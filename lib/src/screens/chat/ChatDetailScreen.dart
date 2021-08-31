import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/message.dart';
import 'package:ideal/src/models/user.dart';

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
            Container(
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
                      decoration:
                          InputDecoration.collapsed(hintText: "Send a message"),
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
            ),
          ],
        ),
      ),
    );
  }
}

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
