import 'dart:io';
import 'dart:core';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';

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

  Future sendImage() async {
    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    var length = await _image.length();

    var uri = Uri.parse("https://ct-tech-pirates.herokuapp.com/api/identify");

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('raw-image', stream, length,
        filename: basename(_image.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      var data = json.decode(value);
      print(data);
    });
    // Navigate to the second screen using a named route
//    Navigator.pushNamed(context, '/list');
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
        child:
        _image == null ? Text('No image taken yet.') :
          Column(children: <Widget>[
            Expanded(
              child: Image.file(_image)),
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
