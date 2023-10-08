import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/text_button_text_widget.dart';

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
        onPressed: () {
          onPressed();
        },
        child: TextButtonTextWidget(text: text));
  }
}
