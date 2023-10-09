import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';

/// A floating action button that resides on bottom navigation bar.
class BottomNavBarFloatingButton extends StatelessWidget {
  /// Creates a [BottomNavBarFloatingButton] widget.
  ///
  /// Takes no argument.
  const BottomNavBarFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        onPressed: () {
          /// Calls the method that adds message in the
          /// database from the viewmodel.
          context.read<ChatPageViewModel>().requestAddMessagesToDatabaseApi();
        },
        child: context.watch<ChatPageViewModel>().defaultIcon,
      ),
    );
  }
}
