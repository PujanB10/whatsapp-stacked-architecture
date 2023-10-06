import 'package:flutter/material.dart';

class AppBarTitleTextWidget extends StatelessWidget {
  final String text;
  const AppBarTitleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
