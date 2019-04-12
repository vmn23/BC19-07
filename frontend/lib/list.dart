import 'package:flutter/material.dart';

import './star.dart';

class List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<List> {
  final symptomFilter = TextEditingController();
  int rating = 5;
  int price = 0;

  void dispose() {
    symptomFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('Take a look at your options')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: symptomFilter,
                decoration: new InputDecoration(
                  labelText: "Filter by symptoms",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  color: Colors.black87,
                  fontFamily: "Poppins",
                ),
              ),
              Row(children: <Widget>[
                Text('Rating ≥ ', style: new TextStyle(color: Colors.black87, fontFamily: "Poppins", fontSize: 16),),
                StarRating(
                  rating: rating,
                  onRatingChanged: (rating) =>
                      setState(() => this.rating = rating),
                ),
                Text('         '),
                Text('Price ≤ ', style: new TextStyle(color: Colors.black87, fontFamily: "Poppins", fontSize: 16),),
                StarRating(
                  rating: price,
                  star: false,
                  onRatingChanged: (price) =>
                      setState(() => this.price = price),
                ),
              ]),
              Text(symptomFilter.text),
              Text(rating.toString()),
              Text(price.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
