import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';

/// Service class that helps with different chat features.
class ChatService {
  final db = FirebaseFirestore.instance;

  /// Stream method that takes [chatId] as argument and calls an API that fetches the
  /// chat messages of the given [chatId] from the database.
  Stream<List<ChatModel>> fetchChatMessages({required String chatId}) {
    return db
        .collection("messages")
        .doc(chatId)
        .collection("message")
        .orderBy("sentTime", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map((doc) => ChatModel.fromJson(doc)).toList());
    // debugPrint(list.toString());
  }

  /// Future Method that takes in [chatId] and [messageInfo] as argument and
  /// adds the [messageInfo] in the database.
  Future<void> requestAddMessagesToDatabaseApi(
      {required Map<String, dynamic> messageInfo,
      required String chatId}) async {
    await db
        .collection("messages")
        .doc(chatId)
        .collection("message")
        .add(messageInfo);
  }
}
