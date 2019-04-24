class Review {
  final String username;
  final String subject;
  final String text;
  final int rating;

  Review({this.username, this.subject, this.text, this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review (
      username: json["user_name"],
      subject: json["subject"],
      text: json["text"],
      rating: json["rating"],
    );
  }
}

class Rating {
  final double average;
  final int fiveStarCount;
  final int fourStarCount;
  final int threeStarCount;
  final int twoStarCount;
  final int oneStarCount;

  Rating({this.average, this.fiveStarCount, this.fourStarCount, this.threeStarCount, this.twoStarCount, this.oneStarCount});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating (
      average: json["average"], 
      fiveStarCount: json["5_star_count"],
      fourStarCount: json["4_star_count"],
      threeStarCount: json["3_star_count"],
      twoStarCount: json["2_star_count"],
      oneStarCount: json["1_star_count"],
      );
  }
}