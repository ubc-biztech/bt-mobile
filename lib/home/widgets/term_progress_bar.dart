import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../home_model.dart';
import '../home_presenter.dart';

class TermProgressBar extends StatelessWidget {
  const TermProgressBar({
    Key key,
    @required this.presenter,
    @required this.model,
  }) : super(key: key);

  final HomePresenter presenter;
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _InnerContainer(
        presenter: presenter,
        model: model,
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

class _InnerContainer extends StatelessWidget {
  const _InnerContainer({
    Key key,
    @required this.presenter,
    @required this.model,
  }) : super(key: key);

  final HomePresenter presenter;
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero, () => presenter.setProgressWidth(context.size.width));
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      height: 24.0,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        color: C.bizTechGrey,
        width: model.topProgressWidth,
        height: 24.0,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
