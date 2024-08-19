import 'package:flutter/material.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class EmergencyDetails extends StatelessWidget {
  const EmergencyDetails(
      {super.key,
      required this.name,
      required this.img,
      required this.contact,
      required this.location});
  final String name;
  final String img;
  final String contact;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Emergency",
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(Icons.emergency_share_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      location,
                      style: StyledTheme.styledFonts.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      contact,
                      style: StyledTheme.styledFonts.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
