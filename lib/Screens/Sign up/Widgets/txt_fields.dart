import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/Sign%20in/Provider/signin_provider.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';

class TxtFields extends StatelessWidget {
  const TxtFields(
      {super.key,
      required this.prefixIcon,
      required this.hintTxt,
      required this.controller,
      this.isPass,
      this.isName});
  final Widget prefixIcon;
  final String hintTxt;
  final TextEditingController controller;
  final bool? isPass;
  final bool? isName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Consumer<SigninProvider>(
          builder: (context, pro, child) => Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(.1),
                border: Border.all(
                    color: pro.isLogin == false ? Colors.red : Colors.white,
                    width: .5)),
            child: TextFormField(
              obscureText: isPass == true ? true : false,
              textCapitalization: isName == true
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              controller: controller,
              style: StyledTheme.styledFonts,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                hintText: hintTxt,
                hintStyle:
                    StyledTheme.styledFonts.copyWith(color: Colors.white),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(bottom: 10, top: 10),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  pro.checkLogin(true);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
