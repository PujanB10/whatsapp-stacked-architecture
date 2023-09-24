import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';

class ChatPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  static final Map<String, dynamic> _dummyChat = {
    "Pujan": [
      {"message": "Hey there! How's your day going?", "isUser": false},
    ],
    "Ram": [
      {"message": "I just tried a new recipe.", "isUser": false},
    ],
    "Shyam": [
      {"message": "Do you believe in aliens?", "isUser": false},
    ],
    "Gita": [
      {"message": "I can't wait for the weekend to relax.", "isUser": false},
    ],
    "Sita": [
      {"message": "Have you ever been on a trip?", "isUser": false},
    ],
    "Rakesh": [
      {"message": "What's your favorite book of all time?", "isUser": false},
    ],
    "Abishek": [
      {"message": "Just finished a great workout.", "isUser": false},
    ],
    "Rita": [
      {"message": "Thinking about starting a new hobby.", "isUser": false},
    ],
    "Nita": [
      {"message": "The weather today is so unpredictable.", "isUser": false},
    ],
  };

  Icon _defaultIcon = const Icon(Icons.mic);

  Icon get defaultIcon => _defaultIcon;
  Map get dummyChat => _dummyChat;

  /// Checks the existence of the user in the Static Variable [_dummyChat].
  /// If not, creates one. If it already exists adds the sent message
  /// to the Static Variable [_dummyChat]
  void addMessages(
      String userNameFromView, String messageFromView, bool isUserFromView) {
    ChatModel chat = ChatModel(
        userName: userNameFromView,
        messages: messageFromView,
        isUser: isUserFromView);
    if (dummyChat.containsKey(userNameFromView)) {
      // Map<String, dynamic> chatMap = chat.toMapExisting();
      dummyChat[userNameFromView]!
          .add({"message": messageFromView, "isUser": isUserFromView});
    } else {
      {
        Map<String, dynamic> chatMap = chat.toMapNew();
        dummyChat.addEntries(chatMap.entries);
      }
    }
    rebuildUi();
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
