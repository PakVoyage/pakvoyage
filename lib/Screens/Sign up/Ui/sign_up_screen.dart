import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Sign%20in/Ui/sign_in_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

import '../Widgets/txt_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash2.jpg'),
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.5), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.flight_land_sharp,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'Create Account',
                style: StyledTheme.styledFonts.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              // Full Name
              TxtFields(
                controller: nameController,
                hintTxt: 'Full Name',
                isName: true,
                prefixIcon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Email
              TxtFields(
                controller: emailController,
                hintTxt: 'Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Password
              TxtFields(
                controller: passController,
                hintTxt: 'Password',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 20,
                ),
                isPass: true,
              ),
              const SizedBox(
                height: 15,
              ),
              // Confirm Password
              TxtFields(
                controller: confirmPassController,
                hintTxt: 'Confirm password',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 20,
                ),
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),

              // Sign up Button
              GestureDetector(
                onTap: () async {
                  log("Pressed");
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty &&
                      confirmPassController.text.isNotEmpty) {
                    if (passController.text == confirmPassController.text) {
                      log("sign");
                      await FirebaseServices.signUpUser(
                          context,
                          nameController.text,
                          emailController.text,
                          passController.text);
                    } else {
                      log("Passwords do not match");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match')),
                      );
                    }
                  } else {
                    log("Some fields are empty");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please fill in all fields')),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: StyledTheme.btnColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: StyledTheme.styledFonts
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInView(),
                      ));
                },
                child: Text(
                  'Already have an account? Sign in',
                  style: StyledTheme.styledFonts
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
