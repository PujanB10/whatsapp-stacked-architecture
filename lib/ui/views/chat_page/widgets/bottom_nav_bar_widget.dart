import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_floating_button.dart';

@FormView(fields: [FormTextField(name: 'messageInput')])

/// A customizable bottom navigation bar for sending messages
class BottomNavBar extends StatelessWidget {
  /// Creates a [BottomNavBar] widget
  ///
  /// [userName] must not be null.
  ///
  /// [userName] is the username associated with this navigation bar.
  BottomNavBar({super.key, required this.userName, required this.viewModel});
  final String userName;
  final ChatPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Row(
        children: [
          horizontalSpaceSmall,
          Expanded(
            child: TextField(
              controller: viewModel.messageInputController,
              onTap: () {
                /// Updates the text message inserted in the message field
                /// and triggers an icon change.
                context.read<ChatPageViewModel>().setIcon();
              },
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: "Message",
                fillColor: kDefaultIconLightColor,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),

                /// Adds a prefix icon in front of the message text field.
                prefixIcon: const Icon(Icons.emoji_emotions),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.attachment)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpaceSmall,

          /// Send or Record button that resides in the bottom navigation
          /// bar alongside message text field.
          BottomNavBarFloatingButton(userName: userName),
          horizontalSpaceSmall,
          verticalSpaceLargerLarge,
        ],
      ),
    );
  }
}
