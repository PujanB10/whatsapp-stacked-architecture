import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';

class BottomNavBarFloatingButton extends StatelessWidget {
  const BottomNavBarFloatingButton({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        onPressed: () {
          /// Send the message and clears the message text field
          /// on pressing the button.
          context.read<ChatPageViewModel>().addMessages(userName);
        },
        child: context.watch<ChatPageViewModel>().defaultIcon,
      ),
    );
  }
}
