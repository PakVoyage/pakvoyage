class Restaurant {
  final String restaurantId;
  final String restaurantName;
  final String restaurantDescription;
  final String restaurantCity;

  Restaurant({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantDescription,
    required this.restaurantCity,
  });

  // Factory constructor to create a Restaurant object from JSON
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantDescription: json['restaurantDescription'] as String,
      restaurantCity: json['restaurantCity'] as String,
    );
  }

  // Method to convert a Restaurant object to JSON
  Map<String, dynamic> toJson() {
    return {
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'restaurantDescription': restaurantDescription,
      'restaurantCity': restaurantCity,
    };
  }
}
