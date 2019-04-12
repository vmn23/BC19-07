import 'package:flutter/material.dart';

import './druglist.dart' as globals;

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Drug Details'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Text('Description')
    );
  }
  
}