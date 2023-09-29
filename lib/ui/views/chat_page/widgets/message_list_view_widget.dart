import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_box_widget.dart';

/// A messages viewing widget for building a list of chat messages.
class MesssageListViewWidget extends StatelessWidget {
  /// Creates a [MesssageListViewWidget]
  ///
  /// [userName] must not be null.
  const MesssageListViewWidget({super.key, required this.userName});

  /// [userName] is the username with whom the user's messages is to
  /// be displayed.
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /// The numbers of messages present at an instance with the given user.
      itemCount: context.watch<ChatPageViewModel>().dummyChat[userName].length,
      itemBuilder: ((BuildContext context, int index) => ChatBox(
          message: context.read<ChatPageViewModel>().dummyChat[userName][index]
              ["message"],
          isUser: context.read<ChatPageViewModel>().dummyChat[userName][index]
              ["isUser"])),
    );
  }
}
