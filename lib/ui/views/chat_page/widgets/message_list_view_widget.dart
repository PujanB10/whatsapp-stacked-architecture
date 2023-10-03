import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_box_widget.dart';

/// A messages viewing widget for building a list of chat messages.
class MesssageListViewWidget extends StatelessWidget {
  /// Creates a [MesssageListViewWidget]
  ///
  /// [receiverUserId] must not be null.
  const MesssageListViewWidget(
      {super.key,
      required this.receiverUserId,
      required this.chatPageViewModel});

  /// [receiverUserId] is the User Id of the user with whom the user's messages is to
  /// be displayed.
  final String receiverUserId;

  final ChatPageViewModel chatPageViewModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chatPageViewModel.fetchChat(receiverUserId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ChatModel> listOfMessages = snapshot.data!;
            return ListView.builder(
                itemCount: listOfMessages.length,
                itemBuilder: (context, index) {
                  return ChatBox(
                      message: listOfMessages[index].message,
                      isUser: chatPageViewModel
                          .isUser(listOfMessages[index].sentBy));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
    // return Container();
  }
}
