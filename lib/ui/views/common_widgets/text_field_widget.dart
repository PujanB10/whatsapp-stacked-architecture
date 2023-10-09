import 'package:flutter/material.dart';

/// Custom Text field widget for forms such as login, sign-up.
class TextFieldWidget extends StatelessWidget {
  /// Instance of Text Editing Controller that controls the text field
  final TextEditingController textEditingController;

  /// Width of the text field.
  final double width;

  /// Hint text to be shown in the text field.
  final String hintText;

  /// Prefix Icon that displays on the text field.
  final Icon prefixIcon;

  /// Whether the contents in the text field must be hidden or not.
  ///
  /// [true] to enable it
  /// Defaults to [false]
  final bool isObscure;

  /// Creates a [TextFieldWidget].
  ///
  /// [hintText],[width],[textEditingController] and [prefixIcon] must
  /// not be null.
  const TextFieldWidget({
    this.isObscure = false,
    required this.hintText,
    required this.width,
    required this.textEditingController,
    required this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        obscureText: isObscure,
        controller: textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
