import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/home/home.dart';
import 'package:flutter/material.dart';

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
