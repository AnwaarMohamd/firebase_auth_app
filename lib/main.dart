import 'package:firebase_auth_app/ui/screens/auth.dart';
import 'package:firebase_auth_app/ui/screens/home_screen.dart';
import 'package:firebase_auth_app/ui/screens/login_screen.dart';
import 'package:firebase_auth_app/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const Auth(),
      routes: {
        '/':(context) => const Auth(),
        'loginScreen':(context) => const LoginScreen(),
        'signupScreen':(context) => const SignupScreen(),
        'homeScreen':(context) => const HomeScreen(),
      },
    );
  } 
}