import 'package:flutter/material.dart';

/// A widget to display a text as a title for a specific page.
class PageTitleTextWidget extends StatelessWidget {
  /// The text to be displayed as the page title.
  final String text;

  /// Creates a [PageTitleTextWidget] with the specified title text.
  const PageTitleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a Text widget with the specified style from the theme.
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
