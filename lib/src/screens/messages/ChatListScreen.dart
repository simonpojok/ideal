import 'package:flutter/material.dart';
import 'package:ideal/src/constants.dart';
import 'package:ideal/src/models/message.dart';

class MessagesScreen extends StatefulWidget {
  static const MESSAGE_SCREEN_ROUTE = "/MessagesScreen";
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();

  static void goToMessageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(MESSAGE_SCREEN_ROUTE);
  }
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        title: Text("Messages"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final chat = chats[index];
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
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
          );
        },
        itemCount: chats.length,
      ),
    );
  }
}

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
