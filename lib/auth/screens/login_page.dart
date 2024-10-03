// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/components/custom_button.dart';
import 'package:food_delivery_app/auth/components/custom_snack_bar.dart';
import 'package:food_delivery_app/auth/components/custom_textfield.dart';
import 'package:food_delivery_app/home/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  void login() {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(Icons.lock_open_rounded, size: 100, color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 25),
        
            // Message - app slogan
            Text("Food delivery app",
                style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 25),
        
            // email field
            CustomTextField(controller: emailController, hintText: "Email", obscureText: false),
            const SizedBox(height: 10),
        
            // password field
            CustomTextField(controller: passwordController, hintText: "Password", obscureText: true),
            const SizedBox(height: 10),
        
            // login button
            CustomButton(
                title: "Login",
                onTap: () async {
                  if (loginFormKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text, password: passwordController.text);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'wrong-password' ||
                          e.code == 'user-not-found' ||
                          e.code == 'invalid-credential') {
                        showCustomSnackBar(context, "Wrong email or password provided.");
                      } else {
                        showCustomSnackBar(context, "An error occurred. Please try again.");
                      }
                    }
                  }
                }),
            const SizedBox(height: 25),
            //  not a member ? sign up now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign up now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
