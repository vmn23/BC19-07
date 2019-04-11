import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In our case, the app will start
    // on the Landing Widget
    initialRoute: '/',
    routes: {
      // When we navigate to the "/" route, build the Landing Widget
      '/': (context) => Landing(),
      // When we navigate to the "/second" route, build the TakePicture Widget
      '/pic': (context) => TakePicture(),
    },
  ));
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Center(
        child: FlatButton(
          child: Image.asset('assets/PfindRX-01.png'),
          onPressed: () {
            // Navigate to the second screen using a named route
            Navigator.pushNamed(context, '/pic');
          },
        ),
      ),
    );
  }
}

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
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
