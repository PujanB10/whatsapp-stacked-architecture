import 'package:flutter/material.dart';

/// A custom text button widget.
class CustomTextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String textInButton;

  /// Creates a [CustomTextButtonWidget]
  ///
  /// [textInButton] and [onPressed] must not be null
  const CustomTextButtonWidget({
    /// Text that is shown in the button.
    required this.textInButton,

    /// Function that executes when the button is pressed.
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: Text(textInButton)));
  }
}
