import 'package:flutter/material.dart';

/// A widget for displaying a title text.
class TitleTextWidget extends StatelessWidget {
  /// The text to display.
  final String text;

  /// Creates a [TitleTextWidget] with the given [text].
  const TitleTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns a text widget with the given text and titleSmall text style.
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
