import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget to display a text field for inputting messages.
class MessageTextFieldWidget extends StatelessWidget {
  /// Creates a [MessageTextFieldWidget] with the required callback and controller.
  const MessageTextFieldWidget({
    super.key,
    required this.changeIconOnTap,
    required this.controller,
  });

  /// A callback to change the icon when the text field is tapped.
  final VoidCallback changeIconOnTap;

  /// The controller associated with the text input field.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // Returns a sized box containing the text field.
    return SizedBox(
      height: 0.075.sh,
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        controller: controller,
        onTap: () {
          // Updates the text message inserted in the message field
          // and triggers an icon change.
          changeIconOnTap();
        },
        decoration: InputDecoration(
          hintText: "Message",
          hintStyle: Theme.of(context).textTheme.labelLarge,
          fillColor: kDefaultIconLightColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),

          // Adds a prefix icon in front of the message text field.
          prefixIcon: const Icon(Icons.emoji_emotions),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.attachment)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            ],
          ),
        ),
      ),
    );
  }
}
