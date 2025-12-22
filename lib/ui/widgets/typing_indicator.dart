import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "Typing...",
          speed: Duration(milliseconds: 80),
        ),
      ],
      repeatForever: true,
    );
  }
}
