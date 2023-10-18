import 'package:flutter/material.dart';

/// A widget for displaying text in a snackbar.
class SnackbarTextWidget extends StatelessWidget {
  /// The text to display in the snackbar.
  final String text;

  /// Creates a [SnackbarTextWidget] with the given [text].
  const SnackbarTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns a centered text widget with the given text and white color.
    return Center(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
