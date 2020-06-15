import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../home_model.dart';
import '../../home_presenter.dart';

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

/// This needs to be a StatefulWidget so that we can get the dynamic width.
class _InnerContainer extends StatefulWidget {
  const _InnerContainer({
    Key key,
    @required this.presenter,
    @required this.model,
  }) : super(key: key);

  final HomePresenter presenter;
  final HomeModel model;

  @override
  _InnerContainerState createState() => _InnerContainerState();
}

class _InnerContainerState extends State<_InnerContainer> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => widget.presenter.setProgressWidth(context.size.width));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: C.darkColor3,
      constraints: const BoxConstraints(minWidth: double.infinity),
      height: 24.0,
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        color: C.darkColor1,
        width: widget.model.topProgressWidth,
        height: 24.0,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
