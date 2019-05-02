import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String username;
  final String subject;
  final String text;
  final int rating;

  Review({this.username, this.subject, this.text, this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json["user_name"],
      subject: json["subject"],
      text: json["text"],
      rating: json["rating"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Card(
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Text(subject, style: new TextStyle(fontWeight: FontWeight.bold),),
              Text(username, style: new TextStyle(fontStyle: FontStyle.italic),),
              Text(text),
              // Text('Sup ben'),
            ],
          ),
        ),
        width: 400,
      ),
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

  Rating(
      {this.average,
      this.fiveStarCount,
      this.fourStarCount,
      this.threeStarCount,
      this.twoStarCount,
      this.oneStarCount});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json["average"],
      fiveStarCount: json["5_star_count"],
      fourStarCount: json["4_star_count"],
      threeStarCount: json["3_star_count"],
      twoStarCount: json["2_star_count"],
      oneStarCount: json["1_star_count"],
    );
  }
}
