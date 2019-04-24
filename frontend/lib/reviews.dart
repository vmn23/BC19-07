class Reviews {
  final String username;
  final String subject;
  final String text;
  final double rating;

  Reviews({this.username, this.subject, this.text, this.rating});
}

class Rating {
  final double average;
  final int fiveStarCount;
  final int fourStarCount;
  final int threeStarCount;
  final int twoStarCount;
  final int oneStarCount;

  Rating({this.average, this.fiveStarCount, this.fourStarCount, this.threeStarCount, this.twoStarCount, this.oneStarCount});
}