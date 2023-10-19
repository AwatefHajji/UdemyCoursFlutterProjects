import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_chat_app/constans.dart';
import 'package:my_chat_app/models/message_model.dart';
import 'package:my_chat_app/widgets/chat_input.dart';
import 'package:my_chat_app/widgets/custom_chatbubble.dart';
import 'package:my_chat_app/widgets/friend_chatbubble.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'chatView';
  final listviewController = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  @override
  Widget build(BuildContext context) {
    var connectedUserEmail = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: Scaffold(),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          //   return const Text('No messages available.');
          // }

          List<MessageModel> messagesList = snapshot.data!.docs
              .map((doc) => MessageModel.fromJson(doc))
              .toList();

          return Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: listviewController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].sender == connectedUserEmail ?
                          ChatBubble(message: messagesList[index]) : FriendChatBubble(message: messagesList[index]);
                      }),
                ),
                ChatInput(onSendMessage: () {
                  listviewController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                }, connectedUserEmail: connectedUserEmail,),
              ],
            ),
          );
        });
  }
}



//! one time read from firestore

//  return FutureBuilder<QuerySnapshot>(
//         future: messages.get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return ModalProgressHUD(
//               inAsyncCall: true,
//               child: Scaffold(),
//             );
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Text('No messages available.');
//           }

//           List<MessageModel> messagesList = snapshot.data!.docs
//               .map((doc) => MessageModel.fromJson(doc))
//               .toList();
              
//           return Scaffold(
//             backgroundColor: kPrimaryColor,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     kLogo,
//                     width: 50,
//                     height: 50,
//                   ),
//                   const Text(
//                     'Chat',
//                     style: TextStyle(color: kPrimaryColor),
//                   ),
//                 ],
//               ),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: messagesList.length,
//                       itemBuilder: (context, index) {
//                         return ChatBubble(message: messagesList[index]);
//                       }),
//                 ),
//                 ChatInput()
//               ],
//             ),
//           );
//         });
//   }