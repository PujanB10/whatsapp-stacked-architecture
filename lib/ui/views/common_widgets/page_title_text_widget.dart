import 'package:flutter/material.dart';

class PageTitleTextWidget extends StatelessWidget {
  final String text;
  const PageTitleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
