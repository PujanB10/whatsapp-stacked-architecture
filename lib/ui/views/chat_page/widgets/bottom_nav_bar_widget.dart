import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_floating_button.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/message_text_field_widget.dart';

@FormView(fields: [FormTextField(name: 'messageInput')])

/// A customizable bottom navigation bar for sending messages
class BottomNavBar extends StatelessWidget {
  /// Creates a [BottomNavBar] widget
  ///
  /// [userName] must not be null.
  ///
  /// [userName] is the username associated with this navigation bar.
  const BottomNavBar(
      {super.key, required this.userName, required this.viewModel});
  final String userName;
  final ChatPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: MessageTextFieldWidget(
                  controller: viewModel.messageInputController,
                  changeIconOnTap: context.read<ChatPageViewModel>().setIcon),
            ),
            horizontalSpaceSmall,

            /// Send or Record button that resides in the bottom navigation
            /// bar alongside message text field.
            BottomNavBarFloatingButton(userName: userName),
          ],
        ),
      ),
    );
  }
}
