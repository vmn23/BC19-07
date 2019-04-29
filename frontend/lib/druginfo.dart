import 'package:flutter/material.dart';
import './druglist.dart' as globals;
import './reviews.dart';

class DrugData extends StatelessWidget {
  final int index;
  final String drugName;
  final String imageUrl;
  final List<String> tags;
  final Rating rating;
  final List<Review> reviews;
  final List<String> desc;

  DrugData(
      {this.index, this.drugName, this.imageUrl, this.rating, this.tags, this.reviews, this.desc});

  factory DrugData.fromJson(Map<String, dynamic> json) {
    var parseTags = json["tags"].cast<String>();
    var parseRating = Rating.fromJson(json["rating"]);
    var parseReviews = new List<Review>();
    parseReviews = json["reviews"].map((i)=>Review.fromJson(i)).toList().cast<Review>();
    var parseDesc = json["description"].cast<String>();

    return DrugData(
        index: json["index"],
        drugName: json["drug_name"],
        imageUrl: json["image"],
        tags: parseTags,
        rating: parseRating,
        reviews: parseReviews,
        desc: parseDesc,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            globals.selectedDrug = index;
            Navigator.pushNamed(context, '/detail');
          },
          child: Card(
            margin: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Image.network(imageUrl),
                Expanded(
                  child: Column (
                  children: <Widget>[
                    Text(
                      drugName,
                      style:
                          TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                    ),
                    Text(
                      rating.average.toString(),
                      style: TextStyle(fontSize: 16.0, color: Colors.blue[300]),
                    ),
                    Expanded(
                        child: Text(tags.join(", "))
                    ),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ),
        height: 100,
      ),
    );
  }

  Widget buildDetail() {
    TextStyle tStyle = new TextStyle(fontSize: 18.0, color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: Text(drugName),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  child: new Image.asset(imageUrl),
                  height: 200,
                  width: 200,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Rating: ',
                    style: tStyle,
                  ),
                  Text(rating.average.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Tags: ', style: tStyle),
                  Text(tags.join(", ")),
                ],
              ),
              Padding(
                child: Text('Drug Info: ', style: tStyle),
                padding: EdgeInsets.all(10.0),
              ),
              Text(desc.join("\n ")),
              Padding(
                child: Text('Reviews: ', style: tStyle),
                padding: EdgeInsets.all(10.0),
              ),
              Column(children: reviews),
            ],
          ),
        ),
      ),
    );
  }
}
