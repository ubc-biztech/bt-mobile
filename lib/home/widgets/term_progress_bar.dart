import 'package:flutter/material.dart';

import '../home.dart';
import '../home_model.dart';
import '../home_presenter.dart';

class TermProgressBar extends StatelessWidget {
  const TermProgressBar({
    Key key,
    @required this.widget,
    @required this.model,
  }) : super(key: key);

  final Home widget;
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        _BottomProgress(
          presenter: widget.presenter,
        ),
        _TopProgress(
          model: model,
        ),
      ],
    );
  }
}

class _TopProgress extends StatelessWidget {
  const _TopProgress({
    Key key,
    @required this.model,
  }) : super(key: key);

  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        color: const Color(0xFF59595B),
        width: model.topProgressWidth,
        height: 24.0,
        duration: const Duration(milliseconds: 1500),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
    );
  }
}

class _BottomProgress extends StatelessWidget {
  const _BottomProgress({Key key, @required this.presenter}) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero, () => presenter.setProgressWidth(context.size.width));
    return Card(
      child: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        height: 24.0,
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
    );
  }
}
