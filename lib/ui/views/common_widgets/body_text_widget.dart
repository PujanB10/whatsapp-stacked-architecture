import 'package:flutter/material.dart';

/// A widget to display a text in the body of an application.
class BodyTextWidget extends StatelessWidget {
  /// The text to be displayed in the body.
  final String text;

  /// Creates a [BodyTextWidget] with the specified body text.
  const BodyTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a Text widget with the specified style from the theme.
    return Text(text, style: Theme.of(context).textTheme.bodyLarge);
  }
}
