import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/Tours/Ui/tours_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class AllTourView extends StatelessWidget {
  const AllTourView({super.key});

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
            citiesPlaces("Azad Kashmir", context),
            const SizedBox(height: 10),
            citiesPlaces("Chitral", context),
            const SizedBox(height: 10),
            citiesPlaces("Hunza", context),
            const SizedBox(height: 10),
            citiesPlaces("Murree", context),
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
          return TourPackagesView(
            cityName: name == "Azad Kashmir"
                ? "Azad Kashmir"
                : name == "Chitral"
                    ? "Chitral"
                    : name == "Hunza"
                        ? "Hunza"
                        : name == "Murree"
                            ? 'Murree'
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
