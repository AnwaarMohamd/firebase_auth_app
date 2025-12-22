import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/ui/screens/chatbot_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),

      // ✅ Floating Button للبوت
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 6,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ChatbotScreen(),
            ),
          );
        },
        child: CircleAvatar(
          radius: 24,
          backgroundImage: const AssetImage('images/bot.png'),
          backgroundColor: Colors.transparent,
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Screen!'),
            const SizedBox(height: 10),
            const Text('You are successfully logged in.'),
            const SizedBox(height: 10),
            Text(
              user!.email!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
