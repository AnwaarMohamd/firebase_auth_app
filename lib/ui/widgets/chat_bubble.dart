import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    // الفقاعة نفسها
    final bubble = AnimatedScale(
      scale: 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? AppColors.userBubble : AppColors.botBubble,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Avatar البوت
        if (!isUser) ...[
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('images/bot.png'),
          ),
          const SizedBox(width: 6),
        ],

        bubble,

        // مسافة مكان Avatar المستخدم (اختياري)
        if (isUser) const SizedBox(width: 42),
      ],
    );
  }
}
