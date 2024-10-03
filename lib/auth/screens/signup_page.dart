// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/components/custom_button.dart';
import 'package:food_delivery_app/auth/components/custom_snack_bar.dart';
import 'package:food_delivery_app/auth/components/custom_textfield.dart';
import 'package:food_delivery_app/home/screens/home_page.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey();

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Form(
        key: signupFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(Icons.lock_open_rounded, size: 100, color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 25),

            // Message - app slogan
            Text(r"Let's create an account for you",
                style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 25),

            // Email field
            CustomTextField(controller: emailController, hintText: "Email", obscureText: false),
            const SizedBox(height: 10),

            // Password field
            CustomTextField(controller: passwordController, hintText: "Password", obscureText: true),
            const SizedBox(height: 10),

            // Confirm Password field
            CustomTextField(
                controller: confirmPasswordController, hintText: "Confirm Password", obscureText: true),
            const SizedBox(height: 10),

            // Singup button
            CustomButton(
                title: "Sign up",
                onTap: () async {
                  if (signupFormKey.currentState!.validate()) {
                    if (passwordController.text == confirmPasswordController.text) {
                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        passwordController.clear();
                        emailController.clear();
                        confirmPasswordController.clear();

                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showCustomSnackBar(context, "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          showCustomSnackBar(context,
                              "An account already exists for that email. If it is yours, Login instead.");
                        } else if (e.code == 'invalid-email') {
                          showCustomSnackBar(context, "The email provided is invalid.");
                        }
                      }
                    } else {
                      showCustomSnackBar(context, "Passwords are not matching.");
                    }
                  }
                }),
            const SizedBox(height: 25),

            //  Not a member ? sign up now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
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
