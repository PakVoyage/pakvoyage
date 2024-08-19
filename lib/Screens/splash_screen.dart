import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Home/Ui/bottom_bar.dart';
import 'package:pak_voyage/Screens/Sign%20up/Ui/sign_up_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      try {
        // Ensure Firebase is initialized
        await Firebase.initializeApp();

        // Check if user is authenticated
        if (FirebaseAuth.instance.currentUser != null) {
          await FirebaseServices.getUserDetail();
          log('User ID: ${FirebaseServices.userDetail.id}');

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          );
        }
      } catch (e) {
        print('Error in SplashScreen initState: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 177, 108),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash1.jpg'),
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.5), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.flight,
                size: 40,
                color: Colors.white,
              ),
              Text(
                'Pak Voyage',
                style: StyledTheme.styledFonts.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
