import 'package:bt_mobile/home/home_presenter.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Proxima-Nova'),
      home: Home(HomePresenter()),
    );
  }
}
