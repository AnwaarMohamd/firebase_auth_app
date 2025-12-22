
import 'package:firebase_auth_app/data/collage_faq.dart';
class ChatbotEngine {
  static String getAnswer(String question) {
    final q = question.toLowerCase();
    final bool isEnglish = RegExp(r'[a-zA-Z]').hasMatch(q);

    for (var item in CollegeFAQ.data) {
      final keywords = isEnglish
          ? item["keywords"]["en"]
          : item["keywords"]["ar"];

      for (var key in keywords) {
        if (q.contains(key.toLowerCase())) {
          if (isEnglish) {
            return item["a"]["en"];
          } else if (q.contains("ازاي") || q.contains("فين")) {
            return item["a"]["eg"];
          } else {
            return item["a"]["ar"];
          }
        }
      }
    }

    return isEnglish
        ? "Sorry, I didn't understand your question."
        : "معلش مش فاهم سؤالك 😅";
  }
}
