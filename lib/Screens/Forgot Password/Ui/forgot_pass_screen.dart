import 'package:flutter/material.dart';
import 'package:pak_voyage/Auth/authentication.dart';
import 'package:pak_voyage/Screens/Sign%20up/Ui/sign_up_screen.dart';
import '../../../Utils/styled_fonts.dart';
import '../../Sign up/Widgets/txt_fields.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
            const SizedBox(height: 100),
            const Icon(
              Icons.flight_land_sharp,
              size: 80,
              color: Colors.white,
            ),
            Text(
              'Recover Password',
              style: StyledTheme.styledFonts.copyWith(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 100),

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
            const SizedBox(height: 15),

            const Spacer(),
            // Recover Password Button
            GestureDetector(
              onTap: () async {
                String email = emailController.text;
                if (email.isNotEmpty) {
                  if (isValidEmail(email)) {
                    await Authentication.resetPassword(email, context);
                  } else {
                    showSnackBar(context, 'Please enter a valid email address');
                  }
                } else {
                  showSnackBar(context, 'Please enter your email address');
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
                    'Recover Password',
                    style: StyledTheme.styledFonts
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
}
