import 'package:flutter/material.dart';

/// Custom Text field widget for forms such as login, sign-up.
class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final double width;
  final String hintText;
  final Icon prefixIcon;
  final bool isObscure;

  /// Creates a [TextFieldWidget].
  ///
  /// [hintText],[width],[textEditingController] and [prefixIcon] must
  /// not be null.
  const TextFieldWidget({
    /// Hides the texts typed in the text field.
    ///  Used for password fields.
    /// ```true`` to enable it
    /// Defaults to ```false```
    this.isObscure = false,

    /// Hint text to be shown in the text field.
    required this.hintText,

    /// Width of the text field.
    required this.width,

    /// Instance of Text Editing Controller that controls the text field
    required this.textEditingController,

    /// Prefix Icon that displays on the text field.
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
