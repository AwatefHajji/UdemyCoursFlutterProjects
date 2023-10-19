
import 'package:flutter/material.dart';
import 'package:my_chat_app/constans.dart';
import 'package:my_chat_app/models/message_model.dart';

class FriendChatBubble extends StatelessWidget {
  const FriendChatBubble({Key? key, required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )),
        child: Text(
          message.messageText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
