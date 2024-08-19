import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Places/places_screen.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class IsbPlacesView extends StatefulWidget {
  const IsbPlacesView({super.key, required this.cityName});
  final String cityName;

  @override
  State<IsbPlacesView> createState() => _IsbPlacesViewState();
}

class _IsbPlacesViewState extends State<IsbPlacesView> {
  Future<List<Map<String, dynamic>>>? isbPlaces;

  String? imgPath;
  @override
  void initState() {
    super.initState();
    isbPlaces = FirebaseServices.getIslamabadPlaces(widget.cityName);
    log(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    String city = widget.cityName;
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
            Row(
              children: [
                Text(
                  widget.cityName,
                  style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: isbPlaces,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  List<Map<String, dynamic>> attractions = snapshot.data!;

                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        crossAxisSpacing: 8.0, // Space between columns
                        mainAxisSpacing: 8.0, // Space between rows
                        childAspectRatio: 0.75, // Aspect ratio of each item
                      ),
                      padding: const EdgeInsets.all(8.0),
                      itemCount: attractions.length,
                      itemBuilder: (context, index) {
                        var attraction = attractions[index];
                        var ind = index + 1;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailView(
                                    placeName: attraction['attractionName'],
                                    placeImg: city == 'islamabad'
                                        ? 'assets/images/islamabad/isbplace$ind.jpg'
                                        : city == 'karachi'
                                            ? 'assets/images/karachi/karplace$ind.jpg'
                                            : city == 'lahore'
                                                ? 'assets/images/lahore/lhrplace$ind.jpg'
                                                : city == 'multan'
                                                    ? 'assets/images/multan/muxplace$ind.jpg'
                                                    : city == 'quetta'
                                                        ? 'assets/images/quetta/queplace$ind.jpg'
                                                        : '',
                                    placeDes:
                                        attraction['attractionDescription'],
                                    placeRev: '',
                                    city: widget.cityName,
                                  ),
                                ));
                          },
                          child: Card(
                            elevation: 4.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage(city == 'islamabad'
                                            ? 'assets/images/islamabad/isbplace$ind.jpg'
                                            : city == 'karachi'
                                                ? 'assets/images/karachi/karplace$ind.jpg'
                                                : city == 'lahore'
                                                    ? 'assets/images/lahore/lhrplace$ind.jpg'
                                                    : city == 'multan'
                                                        ? 'assets/images/multan/muxplace$ind.jpg'
                                                        : city == 'quetta'
                                                            ? 'assets/images/quetta/queplace$ind.jpg'
                                                            : ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    attraction['attractionName'] ?? 'Unknown',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    attraction['attractionDescription'] ??
                                        'No description',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Text(
                                    'City: ${attraction['attractionCity'] ?? 'Unknown'}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 8.0),
                                //   child: Text(
                                //     'Reviews: ${attraction['reviews']?.length ?? 0}',
                                //     style: const TextStyle(color: Colors.grey),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
