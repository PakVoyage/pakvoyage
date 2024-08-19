import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Profile/Ui/profile_screen.dart';

import 'package:pak_voyage/Utils/styled_fonts.dart';

class NewAppBar extends StatelessWidget {
  const NewAppBar(
      {super.key, this.isHome, this.name, this.title, this.searchController});
  final bool? isHome;
  final String? name;
  final String? title;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/images/appbar-bg.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.6), BlendMode.darken),
          ),
          color: StyledTheme.btnColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isHome == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Hello, ',
                            style: StyledTheme.styledFonts,
                            children: <TextSpan>[
                              TextSpan(
                                  text: FirebaseServices.userDetail.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Explore, ',
                            style: StyledTheme.styledFonts,
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Beautiful World',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          title ?? '',
                          style: StyledTheme.styledFonts.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: FirebaseServices.userDetail.profilePic,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/default dp.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Material(
          //   elevation: 10,
          //   shadowColor: Colors.black.withOpacity(.5),
          //   color: Colors.transparent,
          //   borderRadius: BorderRadius.circular(12),
          //   child: ClipRRect(
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          //       child: Container(
          //         height: 45,
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             border: Border.all(width: .5, color: Colors.white)),
          //         child: TextFormField(
          //           controller: searchController,
          //           textCapitalization: TextCapitalization.words,
          //           style: StyledTheme.styledFonts,
          //           decoration: InputDecoration(
          //               contentPadding:
          //                   const EdgeInsets.only(bottom: 1, top: 8),
          //               border: InputBorder.none,
          //               prefixIcon: const Icon(
          //                 Icons.search,
          //                 color: Colors.blueGrey,
          //               ),
          //               hintText: 'Where do you want to go?',
          //               hintStyle: StyledTheme.styledFonts),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
