import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../home.dart';
import '../../home_model.dart';
import 'term_fraction_stats.dart';
import 'term_progress_bar.dart';

class TermStats extends StatelessWidget {
  const TermStats({
    Key key,
    @required this.model,
    @required this.widget,
  }) : super(key: key);

  final HomeModel model;
  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 16.0),
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
                      maxLines: 1, style: const TextStyle(fontSize: 16.0)),
                  AutoSizeText(model.endDate,
                      maxLines: 1, style: const TextStyle(fontSize: 16.0)),
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
    );
  }
}
