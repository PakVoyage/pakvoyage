class RestaurantModel {
  final String restaurantCity;
  final String restaurantDescription;
  final String restaurantId;
  final String restaurantName;
  final List<String> restaurantReviews;

  RestaurantModel({
    required this.restaurantCity,
    required this.restaurantDescription,
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantReviews,
  });

  // Convert a Restaurant instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'restaurantCity': restaurantCity,
      'restaurantDescription': restaurantDescription,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'restaurantReviews': restaurantReviews,
    };
  }

  // Convert a Map to a Restaurant instance
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantCity: json['restaurantCity'] as String,
      restaurantDescription: json['restaurantDescription'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantReviews: List<String>.from(json['restaurantReviews'] as List),
    );
  }
}
