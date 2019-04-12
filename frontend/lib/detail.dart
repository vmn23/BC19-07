import 'package:flutter/material.dart';

import './druglist.dart' as globals;

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return globals.allDrugs[globals.selectedDrug].buildDetail();
  }
}