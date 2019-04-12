import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class TakePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Take a Picture of the Shelves"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack
            Navigator.pop(context);
          },
          child: Text('Go to camera!'),
        ),
      ),
    );
  }
}
