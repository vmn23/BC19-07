import 'dart:core';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './star.dart';
import './druginfo.dart';
import './druglist.dart' as globals;

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<ListPage> {
  final symptomFilter = TextEditingController();
  int rating = 0;
  int price = 0;

  List<DrugData> filteredDrugs = [];

  Future<String> _loadDrugAsset() async {
    String link;
    link = "";
    return await rootBundle.loadString('assets/sample.json');
    // var res = await http.get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    // return res.body;
  }

  Future loadDrugs() async {
    String jsonString = await _loadDrugAsset();
    final jsonResponse = json.decode(jsonString);
    globals.allDrugs = jsonResponse.map((i)=>DrugData.fromJson(i)).toList().cast<DrugData>();
  }

  @override
  void initState() {
    super.initState();
    loadDrugs();
    symptomFilter.addListener(updateList);
    updateList();
  }

  void dispose() {
    symptomFilter.dispose();
    super.dispose();
  }

  void updateList() {
    filteredDrugs = globals.allDrugs.where((i) => i.rating.average > rating).toList();
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
              filteredDrugs.length == 0
                  ? Text('No drugs match that criteria, please try again')
                  : SingleChildScrollView(
                      child: Column(children: filteredDrugs),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
