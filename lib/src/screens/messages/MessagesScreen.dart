import 'package:flutter/material.dart';
import 'package:ideal/src/models/message.dart';
import 'package:ideal/src/screens/messages/widgets/message_container.dart';

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
          return MessageContainer(chat: chat);
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
