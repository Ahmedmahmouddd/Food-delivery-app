// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/auth/components/custom_snack_bar.dart';

// class AuthServices {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   // Get current user
//   User? getCurrentUser() {
//     return firebaseAuth.currentUser;
//   }

//   // Sign in
//   Future<UserCredential> SigninWithEmailAndPassword(String email, password, BuildContext context) async {
//     try {
//       UserCredential userCredential =
//           await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-credential') {
//         showCustomSnackBar(context, "Wrong email or password provided.");
//       }
//     }
//   }
// }
