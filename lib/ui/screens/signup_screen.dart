import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
 

  Future signUp() async {
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ); 
      Navigator.of(context).pushNamed('/');
    }
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() ==
    _confirmPasswordController.text.trim()){
      return true;
    } else {
      return false;
    }
  }

   void openSigninScreen() {
    Navigator.of(
      context).pushReplacementNamed('loginScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                
                Image.asset(
                  'images/login_image.png',
                  height: 290,
                  width: 300,
                ),
                // title
            
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold,
                    ).fontFamily,
                  ),
                ),
                // subtitle
                SizedBox(height: 10),
                Text(
                  'Welcome! Please create an account.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
            
                // email textfield
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
            
                // password textfield
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                // confirm password textfield
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),


                // Sign Up button

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: GoogleFonts.robotoCondensed(
                            ).fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            
                // signin text
                
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap:openSigninScreen,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}