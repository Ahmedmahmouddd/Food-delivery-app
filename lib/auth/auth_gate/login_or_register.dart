import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/screens/login_page.dart';
import 'package:food_delivery_app/auth/screens/signup_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggleScreens);
    } else {
      return SignUpPage(onTap: toggleScreens);
    }
  }
}
