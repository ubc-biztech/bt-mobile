import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import 'home_presenter.dart';
import 'home_view.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: <Widget>[
                AutoSizeText(
                  model.salutation,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 36.0),
                ),
                const SizedBox(height: 11.0),
                AutoSizeText(
                  model.date,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 36.0),
                ),
                Row(
                  children: <Widget>[

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
