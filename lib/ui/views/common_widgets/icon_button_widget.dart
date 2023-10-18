import 'package:flutter/material.dart';

/// A widget for displaying an icon button.
class IconButtonWidget extends StatelessWidget {
  /// The icon to display on the button.
  final Icon iconName;

  /// The function to call when the button is pressed.
  final VoidCallback onPressed;

  /// Creates an [IconButtonWidget] with the given [iconName] and [onPressed] function.
  const IconButtonWidget({
    required this.onPressed,
    required this.iconName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns an icon button with the given icon and onPressed function.
    return IconButton(
      icon: iconName,
      onPressed: () {
        onPressed();
      },
    );
  }
}
