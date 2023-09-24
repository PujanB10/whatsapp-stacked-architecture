import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';

class BottomNavBarFloatingButton extends StatelessWidget {
  const BottomNavBarFloatingButton({
    super.key,
    required this.userName,
    required this.textController,
  });

  final String userName;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        /// Send the message and clears the message text field
        /// on pressing the button.
        context
            .read<ChatPageViewModel>()
            .addMessages(userName, textController.text, true);
        textController.clear();
      },
      child: context.watch<ChatPageViewModel>().defaultIcon,
    );
  }
}
