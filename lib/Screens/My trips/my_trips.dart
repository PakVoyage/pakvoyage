import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/My%20trips/my_trips_details.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(null),
          title: Text(
            'My Trips',
            style: StyledTheme.styledFonts.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseServices.firestore
                .collection('mytrips')
                .where('userId', isEqualTo: FirebaseServices.userID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                    child: Text(
                  "You have no trips book with us",
                  style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ));
              }

              var data = snapshot.data!.docs;

              return ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var trip = data[index].data() as Map<String, dynamic>;
                  String tripName = trip['name'] ?? '';
                  String details = trip['details'] ?? '';
                  String date = trip['date'] ?? '';
                  String price = trip['price'] ?? '';
                  String route = trip['route'] ?? '';
                  String img = trip['img'] ?? '';

                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyTripsDetails(
                              name: tripName,
                              img: img,
                              duration: date,
                              route: route,
                              price: price,
                              details: details),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            height: 150,
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(.1),
                              border: Border.all(
                                  width: 1, color: Colors.blueAccent),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                    child: Image.asset(
                                      img,
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tripName,
                                        maxLines: 1,
                                        style: StyledTheme.styledFonts.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        details,
                                        maxLines: 2,
                                        style: StyledTheme.styledFonts.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 14,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            date,
                                            style: StyledTheme.styledFonts
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.flight,
                                            size: 14,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            route,
                                            style: StyledTheme.styledFonts
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.monetization_on,
                                            color: Colors.green,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            price,
                                            style: StyledTheme.styledFonts
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
