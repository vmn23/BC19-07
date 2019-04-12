import 'package:flutter/material.dart';

typedef void RatingChangeCallback(int rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final bool star;

  StarRating({this.starCount = 5, this.rating = 0, this.onRatingChanged, this.color, this.star = true});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (star) {
      if (index >= rating) {
        icon = new Icon(
          Icons.star_border,
          color: Colors.black38,
        );
      } else {
        icon = new Icon(
          Icons.star,
          color: color ?? Colors.blueGrey[900],
        );
      }
    } else {
      if (index >= rating) {
        icon = new Icon(
          Icons.attach_money,
          color: Colors.black38,
        );
      } else {
        icon = new Icon(
          Icons.attach_money,
          color: color ?? Colors.blueGrey[900],
        );
      }
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}