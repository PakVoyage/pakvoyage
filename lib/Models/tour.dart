import 'package:cloud_firestore/cloud_firestore.dart';

class TourModel {
  final String name;
  final String imgUrl;
  final String location;
  final String duration;
  final String availability;
  final String route;
  final String price;
  final String details;
  final int days;
  final List<String> reviews;
  final String tourId;

  TourModel({
    required this.name,
    required this.location,
    required this.imgUrl,
    required this.duration,
    required this.availability,
    required this.route,
    required this.price,
    required this.details,
    required this.days,
    required this.reviews,
    required this.tourId,
  });

  // Factory constructor to create a TourModel instance from a Firestore document
  factory TourModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TourModel(
      name: data['name'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      location: data['location'] ?? '',
      duration: data['duration'] ?? '',
      availability: data['availability'] ?? '',
      route: data['route'] ?? '',
      price: data['price'] ?? '',
      details: data['details'] ?? '',
      days: data['days'] ?? 0,
      reviews: List<String>.from(data['reviews'] ?? []),
      tourId: data['tourId'] ?? '',
    );
  }

  // Method to convert a TourModel instance to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'location': location,
      'duration': duration,
      'availability': availability,
      'route': route,
      'price': price,
      'details': details,
      'days': days,
      'reviews': reviews,
      'tourId': tourId,
    };
  }
}
