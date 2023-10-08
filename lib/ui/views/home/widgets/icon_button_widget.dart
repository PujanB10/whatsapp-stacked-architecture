import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Icon iconName;
  final VoidCallback onPressed;
  const IconButtonWidget(
      {required this.onPressed, required this.iconName, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconName,
      onPressed: () {
        onPressed();
      },
    );
  }
}
