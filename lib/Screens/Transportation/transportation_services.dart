import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Transportation/service_detail.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class TransportationServices extends StatefulWidget {
  const TransportationServices({super.key, required this.cityName});
  final String cityName;

  @override
  State<TransportationServices> createState() => _TransportationServicesState();
}

class _TransportationServicesState extends State<TransportationServices> {
  Future<List<Map<String, dynamic>>>? isbPlaces;

  @override
  void initState() {
    super.initState();
    isbPlaces = FirebaseServices.getTransportation(widget.cityName);
    log(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pakistan Transportation Services',
          style: StyledTheme.styledFonts.copyWith(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
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
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.75,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      itemCount: attractions.length,
                      itemBuilder: (context, index) {
                        var attraction = attractions[index];
                        var transportName = attraction['name'] ?? '';

                        log(transportName);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServiceDetails(
                                  name: attraction['name'] ?? '',
                                  booking: attraction['booking'] ?? '',
                                  description: attraction['description'] ?? '',
                                  routes: attraction['routes'] ?? [''],
                                  options: attraction['options'] ?? [''],
                                  transportPic: _getImagePath(transportName),
                                ),
                              ),
                            );
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
                                        image: AssetImage(
                                            _getImagePath(transportName)),
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
                                    attraction['description'] ??
                                        'No description',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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

  String _getImagePath(String transportName) {
    transportName = transportName.toLowerCase();
    if (transportName == 'metro bus') {
      return 'assets/images/transportation/METRO BUS.jpg';
    } else if (transportName == 'ride hailing services') {
      return 'assets/images/transportation/CAREEM.png';
    } else if (transportName == 'taxis rickshaws') {
      return 'assets/images/transportation/TAXIS,RICKSHAWS.jpg';
    } else if (transportName == 'orange line metro train') {
      return 'assets/images/transportation/Orange Line.png';
    } else if (transportName == 'speed of lahore') {
      return 'assets/images/transportation/Speedo.jpg';
    } else if (transportName == 'green line') {
      return 'assets/images/transportation/Green Line BRT.jpg';
    } else if (transportName == 'public buses and mini buses') {
      return 'assets/images/transportation/BRT.png';
    } else {
      return 'assets/images/transportation.jpg'; // Default image
    }
  }
}
