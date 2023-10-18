import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A widget for displaying social media buttons.
class SocialMediaButtons extends StatelessWidget {
  /// Creates a [SocialMediaButtons] widget.
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a row of social media buttons.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.google)),
        IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.facebook)),
        IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.instagram))
      ],
    );
  }
}
