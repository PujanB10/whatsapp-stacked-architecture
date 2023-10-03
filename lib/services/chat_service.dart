import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';

class ChatService {
  final db = FirebaseFirestore.instance;

  Stream<List<ChatModel>> fetchChatMessages(String chatId) {
    var list = db
        .collection("messages")
        .doc(chatId)
        .collection("message")
        .orderBy("sentTime")
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map((doc) => ChatModel.fromJson(doc)).toList());
    debugPrint(list.toString());
    return list;
  }

  Future<void> addMessageInDatabase(
      Map<String, dynamic> messageInfo, String chatId) async {
    db
        .collection("messages")
        .doc(chatId)
        .collection("message")
        .add(messageInfo);
  }
}
// e9Z3HeEwPVPq1ZCK3vYGBCb9lVS2-Z4ip1wtNE9c8gVMuoeohN6CCX9G2
// shyam - pujan