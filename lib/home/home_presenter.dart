import 'package:intl/intl.dart';

import '../base/presenter.dart';
import '../common/term_manager.dart';
import '../constants/strings.dart';
import 'home_model.dart';
import 'home_view.dart';

class HomePresenter extends Presenter<HomeView, HomeModel> {
  HomePresenter() {
    model = HomeModel();
    setGreeting();
    final DateFormat format = DateFormat('MMMEd');
    model.date = DateFormat('yMMMEd').format(today);
    model.startDate = format.format(termStart);
    model.endDate = format.format(termEnd);
    setStats();
    final TermManager termManager = TermManager();
    termManager.setupTermManager();
  }

  DateTime today = DateTime.now();
  DateTime termStart = DateTime(2020, 5, 11);
  DateTime termEnd = DateTime(2020, 6, 18);

  void setStats() {
    final int todayDiff = today.difference(termStart).inDays;
    final int endDiff = termEnd.difference(termStart).inDays;

    final int numericDayNumerator = todayDiff + 1 < 0 ? 0 : todayDiff + 1;
    final int numericDayDenominator = endDiff + 1;

    model.percentage = numericDayNumerator / numericDayDenominator;
    if (model.percentage > 1.0) {
      model.percentage = 1.0;
    }

    model.numericDayNumerator =
        S.dayNumerator.replaceFirst(S.r, '$numericDayNumerator');
    model.numericDayDenominator =
        S.dayDenominator.replaceFirst(S.r, '$numericDayDenominator');

    int numericWeekNumerator =
        ((todayDiff + termStart.weekday - 1) / 7).floor() + 1;
    numericWeekNumerator = numericWeekNumerator < 0 ? 0 : numericWeekNumerator;
    final int numericWeekDenominator =
        (endDiff + termStart.weekday + (7 - termEnd.weekday)) ~/ 7;
    model.numericWeekNumerator =
        S.weekNumerator.replaceFirst(S.r, '$numericWeekNumerator');
    model.numericWeekDenominator =
        S.weekDenominator.replaceFirst(S.r, '$numericWeekDenominator');
  }

  void setGreeting() {
    if (today.hour >= 4 && today.hour < 12) {
      model.salutation = S.goodMorning;
    } else if (today.hour >= 12 && today.hour < 13) {
      model.salutation = S.goodDay;
    } else if (today.hour >= 13 && today.hour < 17) {
      model.salutation = S.goodAfternoon;
    } else {
      model.salutation = S.goodEvening;
    }
  }

  void setProgressWidth(double width) {
    model.topProgressWidth = model.percentage * width;
    updateView();
  }
}
