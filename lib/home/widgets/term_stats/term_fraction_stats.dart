import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../home_model.dart';

class TermFractionStats extends StatelessWidget {
  const TermFractionStats({
    Key key,
    @required this.model,
  }) : super(key: key);

  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _FractionStat(
          numeratorText: model.numericDayNumerator,
          denominatorText: model.numericDayDenominator,
        ),
        _FractionStat(
          numeratorText: model.numericWeekNumerator,
          denominatorText: model.numericWeekDenominator,
        )
      ],
    );
  }
}

class _FractionStat extends StatelessWidget {
  const _FractionStat({
    Key key,
    @required this.numeratorText,
    @required this.denominatorText,
  }) : super(key: key);

  final String numeratorText;
  final String denominatorText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AutoSizeText(
          numeratorText,
          maxLines: 1,
          style: const TextStyle(fontSize: 24.0),
        ),
        AutoSizeText(
          denominatorText,
          maxLines: 1,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
