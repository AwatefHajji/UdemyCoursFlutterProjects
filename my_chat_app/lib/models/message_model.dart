class MessageModel {
  final String messageText;
  final String sender;
  MessageModel({required this.sender,required this.messageText});
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(messageText: jsonData['message'], sender: jsonData['sender']);
  }
}
