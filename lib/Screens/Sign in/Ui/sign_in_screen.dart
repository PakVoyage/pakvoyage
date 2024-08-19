import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pak_voyage/Auth/authentication.dart';
import 'package:pak_voyage/Screens/Sign%20in/Provider/signin_provider.dart';
import 'package:pak_voyage/Screens/Sign%20up/Ui/sign_up_screen.dart';
import 'package:provider/provider.dart';
import '../../../Utils/styled_fonts.dart';
import '../../Forgot Password/Ui/forgot_pass_screen.dart';
import '../../Sign up/Widgets/txt_fields.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              'Sign in',
              style: StyledTheme.styledFonts.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 100,
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
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassView(),
                  )),
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.start,
                style: StyledTheme.styledFonts.copyWith(fontSize: 12),
              ),
            ),
            const Spacer(),
            // Sign up Button
            GestureDetector(
              onTap: () {
                log(emailController.text.toLowerCase());
                log(passController.text);
                Authentication.signIn(
                  emailController.text,
                  passController.text,
                  context,
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: StyledTheme.btnColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer(
                  builder: (context, SigninProvider pro, child) => Center(
                    child: pro.isNext == true
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Sign in',
                            style: StyledTheme.styledFonts
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
              },
              child: Text(
                "Don't have an account? Sign up",
                style: StyledTheme.styledFonts
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
