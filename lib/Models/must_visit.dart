import 'package:pak_voyage/Models/review.dart';

class MustVisitAttraction {
  final String attractionId;
  final String attractionName;
  final String attractionDescription;
  final String attractionCity;
  final List<Review> reviews;

  MustVisitAttraction({
    required this.attractionId,
    required this.attractionName,
    required this.attractionDescription,
    required this.attractionCity,
    required this.reviews,
  });

  Map<String, dynamic> toJson() {
    return {
      'attractionId': attractionId,
      'attractionName': attractionName,
      'attractionDescription': attractionDescription,
      'attractionCity': attractionCity,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  static MustVisitAttraction fromJson(Map<String, dynamic> json) {
    return MustVisitAttraction(
      attractionId: json['attractionId'],
      attractionName: json['attractionName'],
      attractionDescription: json['attractionDescription'],
      attractionCity: json['attractionCity'],
      reviews: (json['reviews'] as List<dynamic>)
          .map((item) => Review.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
