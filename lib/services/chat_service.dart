import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';

/// Service class that helps with different chat features.
class ChatService {
  final db = FirebaseFirestore.instance;

  /// Stream method that takes [chatId] as argument and fetches the
  /// chat messages of the given [chatId] from the database.
  Stream<List<ChatModel>> fetchChatMessages({required String chatId}) {
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

  /// Future Method that takes in [chatId] and [messageInfo] as argument and
  /// adds the [messageInfo] in the database.
  Future<void> addMessageInDatabase(
      {required Map<String, dynamic> messageInfo,
      required String chatId}) async {
    await db
        .collection("messages")
        .doc(chatId)
        .collection("message")
        .add(messageInfo);
  }
}
