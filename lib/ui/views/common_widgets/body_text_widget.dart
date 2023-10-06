import 'package:flutter/material.dart';

class BodyTextWidget extends StatelessWidget {
  final String text;
  const BodyTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyLarge);
  }
}
