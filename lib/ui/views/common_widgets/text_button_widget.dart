import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const TextButtonWidget({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColor.primary,
              ),
        ));
  }
}
