import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  const TitleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
