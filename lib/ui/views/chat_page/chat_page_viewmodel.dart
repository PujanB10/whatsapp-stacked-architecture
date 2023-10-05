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

  /// Takes in [checkUserId] parameter and checks if it is
  /// the user that is currently logged ni to the app.
  /// Returns ``` true ``` if it is the userId of the user currently logged in.
  /// Returns ``` false ``` if it is not the userId of the user currently logged in.
  bool isUser(String checkUserId) {
    return currentUserId == checkUserId;
  }

  /// Takes in [currentUserId] and [receiverUserId] as parameters and concatenates it
  /// by separating it with "-" and arranging in ascending order and assigns
  /// the string formed as [chatId].
  ///
  /// For example:
  /// If ``` currentUserId = "JHbJB86jbjH" ```
  /// and ``` receiverId = "ajnKIUI77JH3"  ```
  /// then ``` chatId = "ajnKIUI77JH3-JHbJB86jbjH" ```
  void getChatId(String currentUserId, String receiverUserId) {
    _chatId = currentUserId.compareTo(receiverUserId) >= 0
        ? "$currentUserId-$receiverUserId"
        : "$receiverUserId-$currentUserId";
  }

  /// Method that calls the service to add the message typed in by
  /// the user to the database.
  void addMessages() async {
    /// Converting the message typed in by the user into Chat model.
    Map<String, dynamic> messageInfo = ChatModel(
            message: messageInputController.text,
            sentBy: _currentUserId,
            sentTime: Timestamp.now())
        .toJson();
    await _chatService.addMessageInDatabase(
        messageInfo: messageInfo, chatId: chatId);
    messageInputController.clear();
  }

  /// Method that calls the service to fetch chat messages from
  /// the database and returns the Stream to the StreamBuilder in
  /// the view.
  Stream<List<ChatModel>> fetchChat(String receiverUserId) {
    getChatId(currentUserId, receiverUserId);
    return _chatService.fetchChatMessages(chatId: _chatId);
  }

  /// Sets mic icon as default and changes the icon to send on calling the function.
  void setIcon() {
    _defaultIcon = const Icon(Icons.send);
    rebuildUi();
  }

  /// Navigates back to the page that sits below the current page in
  /// the navigation stack.
  void navigateBack() {
    _navigationService.back();
  }
}
