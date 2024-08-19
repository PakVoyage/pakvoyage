import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/All%20Places/all_places_view.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class AllPlaces extends StatelessWidget {
  const AllPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pakistan Places',
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            citiesPlaces("ISLAMABAD", context),
            const SizedBox(height: 10),
            citiesPlaces("LAHORE", context),
            const SizedBox(height: 10),
            citiesPlaces("MULTAN", context),
            const SizedBox(height: 10),
            citiesPlaces("KARACHI", context),
            const SizedBox(height: 10),
            citiesPlaces("QUETTA", context),
          ],
        ),
      ),
    );
  }
}

Widget citiesPlaces(String name, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AllPlacesView(
            cityName: name == "ISLAMABAD"
                ? "islamabad"
                : name == "LAHORE"
                    ? "lahore"
                    : name == "MULTAN"
                        ? "multan"
                        : name == "KARACHI"
                            ? "karachi"
                            : name == "QUETTA"
                                ? 'quetta'
                                : '',
          );
        },
      ));
    },
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.teal,
      ),
      child: Center(
        child: Text(
          name,
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
