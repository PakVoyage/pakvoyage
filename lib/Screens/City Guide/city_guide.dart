import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/All%20Cuisines/cuisine_screen.dart';
import 'package:pak_voyage/Screens/All%20Places/all_places_view.dart';
import 'package:pak_voyage/Screens/City%20Guide/Provider/city_guide_provider.dart';
import 'package:pak_voyage/Screens/Emergency/all_emergency.dart';
import 'package:pak_voyage/Screens/Tours/Ui/travel_tips.dart';
import 'package:pak_voyage/Screens/Transportation/transportation_services.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';

class CityGuideView extends StatelessWidget {
  const CityGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(null),
          title: Text(
            'City Guide',
            style: StyledTheme.styledFonts.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => provider.openCity('ISB'),
                child: Row(
                  children: [
                    Text(
                      "Islamabad",
                      style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      provider.isISb
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                    ),
                  ],
                ),
              ),
              if (provider.isISb)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CuisineView(
                                    cityName: "Islamabad",
                                  ),
                                ));
                          },
                          child: const Text("Top Cuisine in Islamabad")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPlacesView(
                                    cityName: "islamabad",
                                  ),
                                ));
                          },
                          child: const Text("Top Places in Islamabad")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportationServices(
                                    cityName: 'islamabad',
                                  ),
                                ));
                          },
                          child: const Text("Transportation in Islamabad")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyServices(
                                    cityName: "islamabad",
                                  ),
                                ));
                          },
                          child: const Text("Emergency Services in Islamabad")),
                    ],
                  ),
                ),
              GestureDetector(
                onTap: () => provider.openCity('Kar'),
                child: Row(
                  children: [
                    Text(
                      "Karachi",
                      style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      provider.isKar
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                    ),
                  ],
                ),
              ),
              if (provider.isKar)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CuisineView(
                                    cityName: "Karachi",
                                  ),
                                ));
                          },
                          child: const Text("Top Cuisine in Karachi")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPlacesView(
                                    cityName: "karachi",
                                  ),
                                ));
                          },
                          child: const Text("Top Places in Karachi")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportationServices(
                                    cityName: 'karachi',
                                  ),
                                ));
                          },
                          child: const Text("Transportation in Karachi")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyServices(
                                    cityName: "karachi",
                                  ),
                                ));
                          },
                          child: const Text("Emergency Services in Karachi")),
                    ],
                  ),
                ),
              GestureDetector(
                onTap: () => provider.openCity('Lhr'),
                child: Row(
                  children: [
                    Text(
                      "Lahore",
                      style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      provider.isLhr
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                    ),
                  ],
                ),
              ),
              if (provider.isLhr)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CuisineView(
                                    cityName: "Lahore",
                                  ),
                                ));
                          },
                          child: const Text("Top Cuisine in Lahore")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPlacesView(
                                    cityName: "lahore",
                                  ),
                                ));
                          },
                          child: const Text("Top Places in Lahore")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportationServices(
                                    cityName: 'lahore',
                                  ),
                                ));
                          },
                          child: const Text("Transportation in Lahore")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyServices(
                                    cityName: "lahore",
                                  ),
                                ));
                          },
                          child: const Text("Emergency Services in Lahore")),
                    ],
                  ),
                ),
              GestureDetector(
                onTap: () => provider.openCity('Mul'),
                child: Row(
                  children: [
                    Text(
                      "Multan",
                      style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      provider.isMul
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                    ),
                  ],
                ),
              ),
              if (provider.isMul)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CuisineView(
                                    cityName: "Multan",
                                  ),
                                ));
                          },
                          child: const Text("Top Cuisine in Multan")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPlacesView(
                                    cityName: "multan",
                                  ),
                                ));
                          },
                          child: const Text("Top Places in Multan")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportationServices(
                                    cityName: 'multan',
                                  ),
                                ));
                          },
                          child: const Text("Transportation in Multan")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyServices(
                                    cityName: "multan",
                                  ),
                                ));
                          },
                          child: const Text("Emergency Services in Multan")),
                    ],
                  ),
                ),
              GestureDetector(
                onTap: () => provider.openCity('Que'),
                child: Row(
                  children: [
                    Text(
                      "Quetta",
                      style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      provider.isQue
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                    ),
                  ],
                ),
              ),
              if (provider.isQue)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CuisineView(
                                    cityName: "Quetta",
                                  ),
                                ));
                          },
                          child: const Text("Top Cuisine in Quetta")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPlacesView(
                                    cityName: "quetta",
                                  ),
                                ));
                          },
                          child: const Text("Top Places in Quetta")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportationServices(
                                    cityName: 'quetta',
                                  ),
                                ));
                          },
                          child: const Text("Transportation in Quetta")),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyServices(
                                    cityName: "quetta",
                                  ),
                                ));
                          },
                          child: const Text("Emergency Services in Quetta")),
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TravelTipsScreen()),
                ),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(12),
                  shadowColor: Colors.black.withOpacity(.5),
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'View Travel Tips',
                      textAlign: TextAlign.center,
                      style: StyledTheme.styledFonts.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
