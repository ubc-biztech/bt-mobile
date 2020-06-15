import 'package:flutter/material.dart';

import 'home_presenter.dart';
import 'home_view.dart';
import 'widgets/greeting_and_weather.dart';
import 'widgets/term_stats/term_stats.dart';

class Home extends StatefulWidget {
  const Home(this.presenter, {Key key}) : super(key: key);

  final HomePresenter presenter;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends HomeView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GreetingAndWeather(model: model),
        TermStats(model: model, widget: widget),
      ],
    );
  }
}
