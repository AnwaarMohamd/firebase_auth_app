import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../logic/chatbot_engine.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/message_input.dart';
import '../widgets/typing_indicator.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [];

  bool isTyping = false; // 👈 البوت بيكتب ولا لأ

  Future<void> sendMessage() async {
    if (controller.text.isEmpty) return;

    final userText = controller.text;

    setState(() {
      // رسالة المستخدم
      messages.add({
        "text": userText,
        "isUser": true,
      });

      // البوت بدأ يكتب
      isTyping = true;
    });

    controller.clear();

    // ⏳ تأخير بسيط كأنه بيفكر
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isTyping = false;

      // رد البوت
      messages.add({
        "text": ChatbotEngine.getAnswer(userText),
        "isUser": false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Bot Chat"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length + (isTyping ? 1 : 0),
              itemBuilder: (_, i) {
                // 👇 لو البوت بيكتب
                if (isTyping && i == messages.length) {
                  return const TypingIndicator();
                }

                return ChatBubble(
                  text: messages[i]["text"],
                  isUser: messages[i]["isUser"],
                );
              },
            ),
          ),
          MessageInput(
            controller: controller,
            onSend: sendMessage,
          ),
        ],
      ),
    );
  }
}
