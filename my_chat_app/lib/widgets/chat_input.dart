import 'package:flutter/material.dart';
import 'package:my_chat_app/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatInput extends StatelessWidget {
  final Function onSendMessage;
  final String connectedUserEmail;
  ChatInput({
    super.key,
    required this.onSendMessage, required this.connectedUserEmail,
  });

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: chatController,
        onSubmitted: (data) {
          messages.add({'message': data, 'createdAt': DateTime.now(), 'sender': connectedUserEmail});
          chatController.clear();
          onSendMessage();
        },
        decoration: InputDecoration(

            suffixIcon: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                // messages.add({
                //   'message': chatController.text,
                //   'createdAt': DateTime.now(),
                // });
                // chatController.clear();
                // onSendMessage();
              },
            ),
            hintText: "Type Something...",
            hintStyle: const TextStyle(color: kPrimaryColor),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
      ),
    );
  }
}
