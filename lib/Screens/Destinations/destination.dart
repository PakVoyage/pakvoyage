import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/Home/Widgets/new_app_bar.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class DestinationView extends StatelessWidget {
  const DestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<String> destinations = [
      "CHITRAL",
      "FAIRY MEADOWS",
      "GILGIT BALTISTAN",
      "HUNZA",
      "Kumrat Valley",
      "KASHMIR",
      "KPK"
    ];
    List<String> destinationsPics = [
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-chit.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-fairy.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/03/5-600x600.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-hunza.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-kum.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-neelum.jpg',
      'https://www.natureadventureclub.pk/wp-content/uploads/2023/04/des-kpk.jpg'
    ];

    return Scaffold(
      body: Column(
        children: [
          NewAppBar(
            title: 'Destinations',
            searchController: searchController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(destinationsPics[index]),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.5), BlendMode.darken)),
                    ),
                    child: Center(
                      child: Text(
                        destinations[index],
                        style: StyledTheme.styledFonts.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // backgroundColor: Colors.black45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
