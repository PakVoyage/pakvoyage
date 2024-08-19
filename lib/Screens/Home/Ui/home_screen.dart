import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/Models/tour.dart';
import 'package:pak_voyage/Screens/All%20Cuisines/all_cuisine_screen.dart';
import 'package:pak_voyage/Screens/All%20Places/all_places_screen.dart';
import 'package:pak_voyage/Screens/Places/places_screen.dart';
import 'package:pak_voyage/Screens/Tours/Ui/all_tours_screen.dart';
import 'package:pak_voyage/Screens/Tours/Ui/tour_details_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

import '../Widgets/new_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>>? topPlaces;
  List<Map<String, dynamic>>? tours;

  @override
  void initState() {
    super.initState();
    fetchTopDiningPlaces().then(
      (value) {
        setState(() {
          topPlaces = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          NewAppBar(
            isHome: true,
            searchController: searchController,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Top Places
                buildSectionTitle('Places for you'),
                const SizedBox(height: 10),
                buildTopPlacesRow(context),
                const SizedBox(height: 10),
                // Top Cuisine
                buildSectionTitle('Cuisine for you'),
                const SizedBox(height: 10),
                buildTopCuisineRow(context),
                const SizedBox(height: 10),
                // Top Tours
                buildSectionTitle('Tours for you'),
                const SizedBox(height: 10),
                // buildTopToursRow(context),
                buildTopToursRow(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: StyledTheme.styledFonts.copyWith(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            title == 'Places for you'
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllPlaces(),
                    ))
                : title == 'Cuisine for you'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCuisineView(),
                        ))
                    : title == 'Tours for you'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllTourView(),
                            ))
                        : null;
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More',
                style: StyledTheme.styledFonts
                    .copyWith(fontSize: 10, color: Colors.black),
              ),
              const Icon(Icons.arrow_forward, size: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopPlacesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildPlaceItem(
            context,
            'Faisal mosque',
            'assets/images/Faisal mosque islamabad.jpg',
            'The largest mosque in Pakistan, known for its modern architecture and vast prayer hall.',
            "Faisal Majis is an exceptional professional who consistently delivers high-quality work and excels in both technical skills and teamwork.",
            'islamabad'),
        buildPlaceItem(
            context,
            'Badshahi mosque',
            'assets/images/badshahi mosque.jpg',
            'An iconic symbol of Mughal architecture and one of the largest mosques in the world.',
            '',
            'lahore'),
        buildPlaceItem(
            context,
            'Quaid Mausoleum',
            'assets/images/Quaid Mausoleum.jpg',
            'The final resting place of Pakistan’s founder, Muhammad Ali Jinnah.',
            '',
            'karachi'),
      ],
    );
  }

  Widget buildTopCuisineRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildPlaceItem2(
            context,
            'Andaaz Restaurant',
            'assets/images/topres1.jpg',
            'Offers a fine dining experience with a focus on Pakistani cuisine, located near Lahore Fort.',
            'Andaaz Restaurant offers an exceptional dining experience with top-notch food, excellent service, and a delightful atmosphere.',
            'lahore',
            'd34b0329-bbae-45f0-a7b8-2afe98b8bce7'),
        // const Places(name: 'Lal Qila', picUrl: 'assets/images/topres2.jpg'),
        buildPlaceItem2(
            context,
            'Bundu Khan Restaurant',
            'assets/images/topres5.jpg',
            'Famous for its barbecue and traditional Pakistani cuisine.',
            'Andaaz Restaurant offers an exceptional dining experience with top-notch food, excellent service, and a delightful atmosphere.',
            'multan',
            '4206dd75-1d2c-463c-ad5d-f7870c8c1f09'),
        buildPlaceItem2(
            context,
            'Tuscany Courtyard',
            'assets/images/islamabad/restaurant/isbres1.jpg',
            'An upscale Italian restaurant known for its authentic pasta, pizzas, and ambiance.',
            'An upscale Italian restaurant known for its authentic pasta, pizzas, and ambiance.',
            'islamabad',
            '1ff7e276-eefa-4506-95a5-a7a4a431ae87'),
      ],
    );
  }

  Widget buildTopToursRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTourItem(context, 'Chitral',
            'assets/images/tours images/Chitral/Choimus Winter Festival in Kalash.jpg'),
        buildTourItem(
          context,
          'Hunza',
          'assets/images/tours images/hunza/5 Days Private Tour to Hunza and Naltar Valley.jpg',
        ),
        buildTourItem(
          context,
          'Murree',
          'assets/images/tours images/Muree/3 days Nathia Gali honeymoon travel package.jpg',
        )
      ],
    );
  }

  Widget buildPlaceItem(BuildContext context, String name, String picUrl,
      String description, String? rev, String city) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailView(
              placeName: name,
              placeImg: picUrl,
              placeDes: description,
              city: '',
            ),
          ),
        );
      },
      child: Places(name: name, picUrl: picUrl),
    );
  }

  Widget buildPlaceItem2(
    BuildContext context,
    String name,
    String picUrl,
    String description,
    String? rev,
    String city,
    String? placeId,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailView(
              placeName: name,
              placeImg: picUrl,
              placeDes: description,
              city: '',
              placeId: placeId ?? '',
              isCuisine: true,
            ),
          ),
        );
      },
      child: Places(name: name, picUrl: picUrl),
    );
  }

  Widget buildTourItem(BuildContext context, String name, String picUrl) {
    return InkWell(
      onTap: () async {
        List<TourModel> tourData = await getToursByLocation(name);
        if (tourData.isNotEmpty) {
          // Assuming you want to use the first TourModel object
          final tour = tourData[0];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TourDetailsScreen(
                tourId: tour.tourId,
                imgUrl: tour.imgUrl,
                name: tour.name,
                details: tour.details,
                availibilty: tour.availability,
                price: tour.price,
                route: tour.route,
              ),
            ),
          );
        } else {
          // Handle case when no tour data is found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No tours available for $name')),
          );
        }
      },
      child: Tours(name: name, picUrl: picUrl),
    );
  }
}

Future<List<TourModel>> getToursByLocation(String location) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('tours')
        .where('location', isEqualTo: location)
        .get();

    // Convert each document to a TourModel instance
    return querySnapshot.docs
        .map((doc) => TourModel.fromDocument(doc))
        .toList();
  } catch (e) {
    log('Failed to fetch tours: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> fetchTopDiningPlaces() async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('city')
        .doc('islamabad')
        .collection('topdiningplaces')
        .get();

    // Transform the documents into a list of maps
    List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
    log('Data fetched successfully');

    return data;
  } catch (e) {
    log('Failed to fetch data: $e');
    print('Failed to fetch data: $e');
    return [];
  }
}

class Places extends StatelessWidget {
  const Places({super.key, required this.name, required this.picUrl});
  final String name;
  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
        image: DecorationImage(image: AssetImage(picUrl), fit: BoxFit.cover),
      ),
    );
  }
}

class Tours extends StatelessWidget {
  const Tours({super.key, required this.name, required this.picUrl});
  final String name;
  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            picUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
