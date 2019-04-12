import 'dart:core';
import 'package:flutter/material.dart';

import './star.dart';
import './druginfo.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<ListPage> {
  final symptomFilter = TextEditingController();
  int rating = 0;
  int price = 0;


  List<DrugSimple> allDrugs = [
    DrugSimple(
        drugName: 'Advil',
        imageUrl: 'asdfsadf',
        rating: 4.3,
        tags: ["bleh", "more bleh"]),
    DrugSimple(
        drugName: 'Advil1', imageUrl: 'asdfsadf', rating: 4.1, tags: ["hello"]),
    DrugSimple(
        drugName: 'Advil2', imageUrl: 'asdfsadf', rating: 3.3, tags: ["headache"]),
    DrugSimple(
        drugName: 'Advil3',
        imageUrl: 'asdfsadf',
        rating: 1.3,
        tags: ["alkdjf"]),
    DrugSimple(
        drugName: 'Advil4',
        imageUrl: 'asdfsadf',
        rating: 2.3,
        tags: ["stomach"]),
  ];

  List<DrugSimple> filteredDrugs;

  @override
  void initState() {
    super.initState();
    symptomFilter.addListener(updateList);
    updateList();
  }

  void dispose() {
    symptomFilter.dispose();
    super.dispose();
  }

  void updateList() {
    filteredDrugs = allDrugs.where((i) => i.rating > rating).toList();
    if (filteredDrugs != null) {
      if (symptomFilter.text != "") {
        filteredDrugs = filteredDrugs
            .where((i) => i.tags.contains(symptomFilter.text))
            .toList();
      }
    }
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
                Text(
                  'Rating ≥ ',
                  style: new TextStyle(
                      color: Colors.black87,
                      fontFamily: "Poppins",
                      fontSize: 16),
                ),
                StarRating(
                  rating: rating,
                  onRatingChanged: (rating) => setState(() {
                        this.rating = rating;
                        updateList();
                      }),
                ),
                Text('         '),
                Text(
                  'Price ≤ ',
                  style: new TextStyle(
                      color: Colors.black87,
                      fontFamily: "Poppins",
                      fontSize: 16),
                ),
                StarRating(
                  rating: price,
                  star: false,
                  onRatingChanged: (price) => setState(() {
                        this.price = price;
                        updateList();
                      }),
                ),
              ]),
              // Text(symptomFilter.text),
              // Text(rating.toString()),
              // Text(price.toString()),
              filteredDrugs.length == 0 ? Text('No drugs match that criteria, please try again'): 
              Column(children: filteredDrugs),
            ],
          ),
        ),
      ),
    );
  }
}
