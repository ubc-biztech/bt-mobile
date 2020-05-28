import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'home/home.dart';

void main() {
  runApp(BizTechMobile());
}

class BizTechMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: S.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
