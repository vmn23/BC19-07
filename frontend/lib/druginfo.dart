import 'package:flutter/material.dart';

class DrugSimple extends StatelessWidget {
  final String drugName;
  final String imageUrl;
  final List<String> tags;
  final double rating;
  // final List reviews;
  // final List desc;

  DrugSimple({this.drugName, this.imageUrl, this.rating, this.tags});

  factory DrugSimple.fromJson(Map<String, dynamic> json) {
    return DrugSimple(
        drugName: json["drug_name"],
        imageUrl: json["images"],
        rating: double.parse(json["rating"]["average"]),
        tags: []
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image.asset('assets/PfindRX_No_Text.png'),
              Column(
                children: <Widget>[Text(drugName), Text(rating.toString())],
              )
            ],
          ),
        ),
      height: 100,  
      ),
    );
  }
}
