import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Emergency/emergency_details.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class EmergencyServices extends StatefulWidget {
  const EmergencyServices({super.key, required this.cityName});
  final String cityName;

  @override
  State<EmergencyServices> createState() => _EmergencyServicesState();
}

class _EmergencyServicesState extends State<EmergencyServices> {
  Future<List<Map<String, dynamic>>>? isbPlaces;

  String? imgPath;
  @override
  void initState() {
    super.initState();
    isbPlaces = FirebaseServices.getEmergency(widget.cityName);
    log(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pakistan Emergency Services ',
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),
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
                        int ind = index + 1;
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmergencyDetails(
                                  name: attraction['name'] ?? 'Unknown',
                                  img: widget.cityName == 'islamabad'
                                      ? 'assets/images/islamabad/emergency/emer$ind.jpg'
                                      : widget.cityName == 'karachi'
                                          ? 'assets/images/karachi/emergency/emer$ind.jpg'
                                          : widget.cityName == 'multan'
                                              ? 'assets/images/multan/emergency/emer$ind.jpg'
                                              : widget.cityName == 'quetta'
                                                  ? 'assets/images/quetta/emergency/emer$ind.jpg'
                                                  : widget.cityName == 'lahore'
                                                      ? 'assets/images/lahore/emergency/emer$ind.jpg'
                                                      : 'assets/images/emergency.jpg',
                                  contact: attraction['contact'] ?? 'Unknown',
                                  location:
                                      attraction['address'] ?? 'No description',
                                ),
                              )),
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
                                        image: AssetImage(widget.cityName ==
                                                'islamabad'
                                            ? 'assets/images/islamabad/emergency/emer$ind.jpg'
                                            : widget.cityName == 'karachi'
                                                ? 'assets/images/karachi/emergency/emer$ind.jpg'
                                                : widget.cityName == 'multan'
                                                    ? 'assets/images/multan/emergency/emer$ind.jpg'
                                                    : widget.cityName ==
                                                            'quetta'
                                                        ? 'assets/images/quetta/emergency/emer$ind.jpg'
                                                        : widget.cityName ==
                                                                'lahore'
                                                            ? 'assets/images/lahore/emergency/emer$ind.jpg'
                                                            : 'assets/images/emergency.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    attraction['name'] ?? 'Unknown',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    attraction['address'] ?? 'No description',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Text(
                                    attraction['contact'] ?? 'Unknown',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
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
