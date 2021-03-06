import 'package:flutter/material.dart';

import './landing.dart';
import './picture.dart';
import './list.dart';
import './detail.dart';

void main() {
  runApp(MaterialApp(
    title: 'PfindRX',
    initialRoute: '/',
    routes: {
      '/': (context) => Landing(),
      '/pic': (context) => TakePicture(),
      '/list': (context) => ListPage(),
      '/detail' : (context) => Detail()
    },
  ));
}
