import 'package:flutter/material.dart';

class SnackbarTextWidget extends StatelessWidget {
  final String text;
  const SnackbarTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
