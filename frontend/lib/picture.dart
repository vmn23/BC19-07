import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePicture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void sendImage() {
    // Navigate to the second screen using a named route
    Navigator.pushNamed(context, '/list');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        title: Text('Take a picture of the shelves in front of you'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: _image == null
            ? Text('No image taken yet.')
            : Column(children: <Widget>[
                Image.file(_image, height: 555),
                RaisedButton(
                  child: Text('Analyze Image'),
                  onPressed: sendImage,
                )
              ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.camera),
        backgroundColor: Colors.blueGrey[900],
      ),
    );
  }
}
