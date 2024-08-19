import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Home/Ui/bottom_bar.dart';
import 'package:pak_voyage/Screens/Sign%20in/Provider/signin_provider.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';

class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signIn(
      String email, String password, BuildContext context) async {
    final provider = Provider.of<SigninProvider>(context, listen: false);
    provider.startLoad(true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseServices.getUserDetail();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
      provider.checkLogin(true);
      provider.startLoad(false);
      // Successfully signed in
      print('User signed in: ${userCredential.user?.email}');
    } catch (e) {
      // Handle errors
      log('Error signing in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            textAlign: TextAlign.center,
            "Invalid Credential!",
            style: StyledTheme.styledFonts,
          ),
        ),
      );
      provider.checkLogin(false);
      provider.startLoad(false);
    }
  }

  static Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Inform the user about successful email sending
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent')),
      );
    } catch (e) {
      // Handle different error types
      String errorMessage;
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-not-found':
            errorMessage = 'No user found with this email.';
            break;
          default:
            errorMessage = 'An unexpected error occurred.';
        }
      } else {
        errorMessage = 'An unexpected error occurred.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
