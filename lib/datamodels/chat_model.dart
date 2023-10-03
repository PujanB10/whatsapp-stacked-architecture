import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String sentBy;
  String message;
  Timestamp sentTime;
  ChatModel(
      {required this.message, required this.sentBy, required this.sentTime});

  factory ChatModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> snapShot) {
    final json = snapShot.data();
    return ChatModel(
        message: json["message"],
        sentBy: json["sentBy"],
        sentTime: json["sentTime"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "sentBy": sentBy,
      "message": message,
      "sentTime": sentTime,
    };
  }
}
