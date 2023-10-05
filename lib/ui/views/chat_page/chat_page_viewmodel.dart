import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';
import 'package:whatsapp_stacked_architecture/services/chat_service.dart';

class ChatPageViewModel extends FormViewModel {
  final _chatService = locator<ChatService>();
  final _navigationService = locator<NavigationService>();
  final TextEditingController messageInputController = TextEditingController();
  Icon _defaultIcon = const Icon(Icons.mic);
  Icon get defaultIcon => _defaultIcon;
  final String _currentUserId = FirebaseAuth.instance.currentUser!.uid;
  String _chatId = "";
  get chatId => _chatId;
  get currentUserId => _currentUserId;

  bool isUser(String checkUserId) {
    return currentUserId == checkUserId;
  }

  void getChatId(String currentUserId, String receiverUserId) {
    _chatId = currentUserId.compareTo(receiverUserId) >= 0
        ? "$currentUserId-$receiverUserId"
        : "$receiverUserId-$currentUserId";
  }

  void addMessages() async {
    Map<String, dynamic> messageInfo = ChatModel(
            message: messageInputController.text,
            sentBy: _currentUserId,
            sentTime: Timestamp.now())
        .toJson();
    final DocumentReference documentReferenceId =
        await _chatService.addMessageInDatabase(messageInfo, chatId);
    messageInputController.clear();
  }

  Stream<List<ChatModel>> fetchChat(String receiverUserId) {
    getChatId(currentUserId, receiverUserId);
    return _chatService.fetchChatMessages(_chatId);
  }

  /// Sets mic icon as default and changes the icon to send on calling the function.
  void setIcon() {
    _defaultIcon = const Icon(Icons.send);
    rebuildUi();
  }

  void navigateBack() {
    _navigationService.back();
  }
}
