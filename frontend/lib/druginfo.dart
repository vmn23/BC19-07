import 'package:flutter/material.dart';
import './druglist.dart' as globals;

class DrugSimple extends StatelessWidget {
  final int index;
  final String drugName;
  final String imageUrl;
  final List<String> tags;
  final double rating;
  final List reviews;
  final List desc;

  DrugSimple(
      {this.index = -1,
      this.drugName,
      this.imageUrl,
      this.rating,
      this.tags,
      this.reviews = const [],
      this.desc = const []});

  factory DrugSimple.fromJson(Map<String, dynamic> json) {
    return DrugSimple(
        drugName: json["drug_name"],
        imageUrl: json["images"],
        rating: double.parse(json["rating"]["average"]),
        tags: []);
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
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Image.asset(imageUrl),
                Column(
                  children: <Widget>[
                    Text(drugName),
                    Text(rating.toString()),
                    Text(tags.join(", "))
                  ],
                )
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
      body: SingleChildScrollView(child:Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              child: new Image.asset(imageUrl),
              height: 200,
              width: 200,
            ),
          ),
          Row(children: <Widget>[Text('Rating: ', style: tStyle,), Text(rating.toString()),],),
          Row(children: <Widget>[Text('Tags: ', style: tStyle), Text(tags.join(", ")),],),
          Text('Drug Info: ', style: tStyle),
          Text(desc.join("\n ")),
          Text('Reviews: ', style: tStyle),
          Text(reviews.join("\n ")),
        ],
      ),
      ),
    );
  }
}
