import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_gate/auth_state.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    //theme
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    //restaurant
    ChangeNotifierProvider(create: (context) => Restaurant()),
  ], child: const FoodDeliveryApp()));
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthState(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
