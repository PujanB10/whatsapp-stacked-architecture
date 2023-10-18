import 'package:flutter/material.dart';

/// A widget to display a text as the title in the AppBar.
class AppBarTitleTextWidget extends StatelessWidget {
  /// The text to be displayed as the title.
  final String text;

  /// Creates an [AppBarTitleTextWidget] with the specified title text.
  const AppBarTitleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a Text widget with the specified style from the theme.
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
