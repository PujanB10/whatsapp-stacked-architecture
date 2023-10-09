import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/chat_model.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_box_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/loading_widget.dart';

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
          List<ChatModel>? listOfMessages;
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              listOfMessages = snapshot.data;
              return ListView.builder(
                  reverse: true,
                  controller: chatPageViewModel.chatScrollController,
                  itemCount: listOfMessages?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        verticalSpaceSmall,
                        ChatBox(
                            message: listOfMessages?[index].message ??
                                "Message not found",
                            isUser: chatPageViewModel.isCurrentUser(
                                listOfMessages?[index].sentBy ?? "")),
                      ],
                    );
                  });
            } else {
              return const LoadingWidget();
            }
          } else {
            return const LoadingWidget();
          }
        });
    // return Container();
  }
}
