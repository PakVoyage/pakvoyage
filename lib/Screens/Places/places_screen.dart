import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pak_voyage/APIs/firebase_services.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class PlaceDetailView extends StatelessWidget {
  const PlaceDetailView({
    super.key,
    required this.placeName,
    required this.placeImg,
    required this.placeDes,
    required this.city,
    this.placeRev,
    this.placeId,
    this.isCuisine,
  });

  final String placeName;
  final String placeImg;
  final String placeDes;
  final String? placeRev;
  final String? placeId;
  final String? city;
  final bool? isCuisine;

  Future<List<Map<String, dynamic>>> _fetchReviews() async {
    try {
      final reviewsSnapshot = await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('topdiningplaces')
          .doc(placeId)
          .get();

      // Get the reviews data as a list of dynamic
      final reviewsData =
          reviewsSnapshot.data()?['reviews'] as List<dynamic>? ?? [];

      // Map each dynamic item to Map<String, dynamic>
      final reviews = reviewsData.map((item) {
        if (item is Map<String, dynamic>) {
          return item;
        } else {
          // Handle items that are not maps; return an empty map
          return <String, dynamic>{};
        }
      }).toList();

      return reviews;
    } catch (e) {
      log('Failed to fetch reviews: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController reviewController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          placeName,
          style: StyledTheme.styledFonts.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                placeImg,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    placeDes,
                    style: StyledTheme.styledFonts.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  isCuisine == true
                      ? Column(
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
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No reviews yet.'));
                                }

                                final reviews = snapshot.data!;

                                return Column(
                                  children: reviews.map((review) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding:
                                            const EdgeInsetsDirectional.all(5),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.brown[50],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.black26,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      review['profilePic'],
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
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
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: 200,
                                                    maxHeight: 100,
                                                  ),
                                                  child: Text(
                                                    review['userName'],
                                                    maxLines: 1,
                                                    style: StyledTheme
                                                        .styledFonts
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: 200,
                                                    maxHeight: 100,
                                                  ),
                                                  child: Text(
                                                    review['review'],
                                                    maxLines: 4,
                                                    style: StyledTheme
                                                        .styledFonts
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
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

                            Row(
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
                                      imageUrl: FirebaseServices
                                          .userDetail.profilePic,
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
                                    log(placeId.toString());
                                    // Call the function to add the review
                                    await _addReview(reviewText, userName,
                                        userPic, placeId!);

                                    // Clear the review input field after submitting
                                    reviewController.clear();
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.blue[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ),
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
      await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('topdiningplaces')
          .doc(resID)
          .update({
        'reviews': FieldValue.arrayUnion([review]),
      });
    } catch (e) {
      log('Failed to add review: $e');
    }
  }
}
