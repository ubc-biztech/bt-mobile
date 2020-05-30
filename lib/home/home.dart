import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../constants/colors.dart';
import 'home_presenter.dart';
import 'home_view.dart';
import 'widgets/home_widgets.dart';
import 'widgets/term_fraction_stats.dart';
import 'widgets/term_progress_bar.dart';

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
      backgroundColor: C.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GreetingAndWeather(model: model),
            Container(
              constraints: const BoxConstraints(minWidth: double.infinity),
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 23.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(model.term,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AutoSizeText(model.startDate,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 16.0)),
                          AutoSizeText(model.endDate,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      TermProgressBar(
                        presenter: widget.presenter,
                        model: model,
                      ),
                      const SizedBox(height: 16.0),
                      TermFractionStats(model: model)
                    ],
                  ),
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
