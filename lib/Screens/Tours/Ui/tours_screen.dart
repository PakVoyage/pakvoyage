import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/Models/tour.dart';
import 'package:pak_voyage/Screens/Tours/Ui/tour_details_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class TourPackagesView extends StatelessWidget {
  final String cityName;

  const TourPackagesView({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tours in $cityName',
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<TourModel>>(
          future: getToursByLocation(cityName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No tours available'));
            } else {
              final tours = snapshot.data!;
              return ListView.builder(
                itemCount: tours.length, // Corrected: use tours.length here
                itemBuilder: (context, index) {
                  final tour = tours[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TourDetailsScreen(
                              imgUrl: tour.imgUrl,
                              name: tour.name,
                              details: tour.details,
                              price: tour.price,
                              route: tour.route,
                              availibilty: tour.availability,
                              tourId: tour.tourId,
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ToursPack(
                        name: tour.name,
                        picUrl: tour.imgUrl,
                        duration: tour.duration,
                        price: tour.price,
                        route: tour.route,
                        details: tour.details,
                        availibility: 'Availability: ${tour.availability}',
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ToursPack extends StatelessWidget {
  const ToursPack({
    super.key,
    required this.name,
    required this.picUrl,
    required this.duration,
    required this.price,
    required this.route,
    required this.details,
    required this.availibility,
  });

  final String name;
  final String picUrl;
  final String duration;
  final String price;
  final String route;
  final String details;
  final String availibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.teal)),
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              picUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: StyledTheme.styledFonts
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(availibility),
            Text(route),
            Text(price),
          ],
        ),
      ),
    );
  }
}

Future<List<TourModel>> getToursByLocation(String location) async {
  try {
    // Reference to the Firestore collection
    final CollectionReference toursCollection =
        FirebaseFirestore.instance.collection('tours');

    // Query the collection for documents where the 'location' field matches the given location
    final QuerySnapshot querySnapshot =
        await toursCollection.where('location', isEqualTo: location).get();

    // Convert the documents to TourModel objects
    final List<TourModel> tours = querySnapshot.docs.map((doc) {
      return TourModel.fromDocument(doc);
    }).toList();

    print('Fetched tours for location $location: $tours');
    return tours;
  } catch (e) {
    print('Error fetching tours by location: $e');
    return [];
  }
}
