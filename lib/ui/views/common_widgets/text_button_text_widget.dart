import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';

class TextButtonTextWidget extends StatelessWidget {
  final String text;
  const TextButtonTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.primary),
    );
  }
}
