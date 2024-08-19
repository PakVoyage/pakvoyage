import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Screens/Tours/Provider/tour_provider.dart';
import 'package:pak_voyage/Screens/Tours/Ui/travel_tips.dart';
import 'package:pak_voyage/Screens/Tours/Widget/new_payment.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';
import 'package:provider/provider.dart';

class TourDetailsScreen extends StatelessWidget {
  const TourDetailsScreen({
    super.key,
    required this.name,
    required this.imgUrl,
    required this.route,
    required this.availibilty,
    required this.details,
    required this.price,
    required this.tourId,
  });
  final String name;
  final String imgUrl;
  final String route;
  final String availibilty;
  final String details;
  final String price;
  final String tourId;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController peopleController = TextEditingController();
    final provider = Provider.of<TourProvider>(context, listen: false);
    // Format the DateTime object to "dd MMM yyyy"

    // Function to clean and parse the price string
    int parsePrice(String price) {
      // Remove non-numeric characters except the decimal point (if any)
      String cleanedPrice = price.replaceAll(RegExp(r'[^\d]'), '');

      // Parse the cleaned string into an integer
      return int.parse(cleanedPrice);
    }

    TextEditingController reviewController = TextEditingController();
    Future<List<Map<String, dynamic>>> _fetchReviews() async {
      try {
        final reviewsSnapshot = await FirebaseFirestore.instance
            .collection('tours')
            .doc(tourId)
            .get();

        final reviewsData =
            reviewsSnapshot.data()?['reviews'] as List<dynamic>?;

        // Ensure that reviewsData is not null and is a list of maps
        if (reviewsData == null) {
          return [];
        }

        // Convert dynamic list to a list of Map<String, dynamic>
        final List<Map<String, dynamic>> reviews = reviewsData
            .where((review) => review is Map<String, dynamic>)
            .cast<Map<String, dynamic>>()
            .toList();

        return reviews;
      } catch (e) {
        log('Failed to fetch reviews: $e');
        return [];
      }
    }

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Material(
                  elevation: 100,
                  borderRadius: BorderRadius.circular(12),
                  shadowColor: Colors.black.withOpacity(.5),
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        const Text("Name"),
                        textField(nameController, false),
                        const SizedBox(
                          height: 10,
                        ),
                        // Phone
                        const Text("Phone Number"),
                        textField(phoneController, true),
                        const SizedBox(
                          height: 10,
                        ),
                        // Name
                        const Text("Travel Dates"),
                        InkWell(
                          onTap: () {
                            provider.showPicker1(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromRGBO(0, 0, 0, 1)
                                    .withOpacity(.2)),
                            child: Consumer<TourProvider>(
                                builder: (context, value, child) => Text(
                                    provider.selectedDate != null
                                        ? provider.formattedDate!
                                        : " Select Dates")),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Name
                        const Text("Number of Persons"),
                        textField(peopleController, true),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (nameController.text.isNotEmpty &&
                                provider.selectedDate != null &&
                                peopleController.text.isNotEmpty) {
                              try {
                                int pricee = parsePrice(
                                    price); // Clean and parse the price string
                                int members = int.parse(peopleController
                                    .text); // Get the number of members

                                provider.getTotal(pricee,
                                    members); // Update the provider with total
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MySample(
                                        name: name,
                                        date: provider.selectedDate.toString(),
                                        details: details,
                                        img: imgUrl,
                                        route: route,
                                        tourId: tourId,
                                      ),
                                    ));
                              } catch (e) {
                                print('Error: $e');
                                // Handle the error, e.g., show an alert dialog
                              }
                            } else {}
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.teal.withOpacity(.5)),
                            child: Center(
                                child: Text(
                              "Book Now",
                              style: StyledTheme.styledFonts,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.teal,
            ),
            child: Center(
                child: Text(
              'Make a trip',
              style:
                  StyledTheme.styledFonts.copyWith(fontWeight: FontWeight.w700),
            )),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: StyledTheme.styledFonts.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.flight,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    route,
                    style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    availibilty,
                    style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.money,
                    color: Colors.green,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    price,
                    style: StyledTheme.styledFonts.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                details,
                style: StyledTheme.styledFonts.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reviews",
                    style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Fetch and display reviews
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _fetchReviews(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No reviews yet.'));
                      }

                      final reviews = snapshot.data!;

                      return Column(
                        children: reviews.map((review) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsetsDirectional.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.brown[50],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.black26,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl: review['profilePic'],
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/images/default dp.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 200,
                                          maxHeight: 100,
                                        ),
                                        child: Text(
                                          review['userName'],
                                          maxLines: 1,
                                          style:
                                              StyledTheme.styledFonts.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 200,
                                          maxHeight: 100,
                                        ),
                                        child: Text(
                                          review['review'],
                                          maxLines: 4,
                                          style:
                                              StyledTheme.styledFonts.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
// Add Condition if Current user Purchased this pkg then they can add review

                  FirebaseServices.userDetail.myTours != null &&
                          FirebaseServices.userDetail.myTours!.isNotEmpty &&
                          FirebaseServices.userDetail.myTours!.contains(tourId)
                      ? Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black26,
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      FirebaseServices.userDetail.profilePic,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/default dp.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: reviewController,
                                style: StyledTheme.styledFonts
                                    .copyWith(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintText: 'Type your review',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                String userName =
                                    FirebaseServices.userDetail.name;
                                String userPic =
                                    FirebaseServices.userDetail.profilePic;
                                String reviewText = reviewController.text;

                                // Call the function to add the review
                                await _addReview(
                                    reviewText, userName, userPic, tourId);

                                // Clear the review input field after submitting
                                reviewController.clear();
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.blue[400],
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'No access to add review',
                          style: StyledTheme.styledFonts
                              .copyWith(color: Colors.red),
                        )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textField(TextEditingController controller, bool isPerson) {
  return Container(
    height: 40,
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(.2)),
    child: TextFormField(
      keyboardType:
          isPerson == true ? TextInputType.number : TextInputType.text,
      controller: controller,
      style: StyledTheme.styledFonts.copyWith(color: Colors.black),
      decoration: const InputDecoration(
          border: InputBorder.none, contentPadding: EdgeInsets.all(10)),
    ),
  );
}

Future<void> _addReview(
    String reviewText, String userName, String userPic, String resID) async {
  final review = {
    'review': reviewText,
    'userName': userName,
    'profilePic': userPic,
    'timestamp': DateTime.now(),
  };

  try {
    await FirebaseFirestore.instance.collection('tours').doc(resID).update({
      'reviews': FieldValue.arrayUnion([review]),
    });
  } catch (e) {
    log('Failed to add review: $e');
  }
}
