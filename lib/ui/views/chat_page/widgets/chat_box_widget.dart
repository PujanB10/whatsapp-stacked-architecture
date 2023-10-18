import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/body_text_widget.dart';

/// Custom chat boxes for displaying chat messages.
class ChatBox extends StatelessWidget {
  /// Creates a [ChatBox] widget.
  ///
  /// [message] and [isUser] must not be null.
  const ChatBox({super.key, required this.message, required this.isUser});

  /// [message] is the chat message that is to be displayed in the chatbox.
  final String message;

  /// [isUser] is to check whether the message is being sent or being received
  /// by the user.
  /// ```isUser = true;``` means the message is sent.
  /// ```isUser = false;``` means the message is received.
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        horizontalSpaceSmall,
        Container(
          constraints: BoxConstraints(maxWidth: 0.8.sw),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            /// Sets the color of chatbox to green if the message is received.
            /// Sets the color of chatbox to white if the message is sent.
            color: isUser
                ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                : kDefaultIconLightColor,
          ),
          child: BodyTextWidget(
            text: message,
          ),
        ),
        horizontalSpaceSmall,
      ],
    );
  }
}
