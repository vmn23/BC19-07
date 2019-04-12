import 'package:flutter/material.dart';

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