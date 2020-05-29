import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'home_presenter.dart';
import 'home_view.dart';
import 'home_widgets.dart';

class Home extends StatefulWidget {
  const Home(this.presenter, {Key key}) : super(key: key);

  final HomePresenter presenter;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends HomeView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.backgroundGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GreetingAndWeather(model: model),
          ],
        ),
      ),
    );
  }
}
