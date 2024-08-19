class Review {
  final String reviewerName;
  final String reviewText;
  final int rating; // Rating out of 5

  Review({
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'reviewerName': reviewerName,
      'reviewText': reviewText,
      'rating': rating,
    };
  }

  static Review fromJson(Map<String, dynamic> json) {
    return Review(
      reviewerName: json['reviewerName'],
      reviewText: json['reviewText'],
      rating: json['rating'],
    );
  }
}
