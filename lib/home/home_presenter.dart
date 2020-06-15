import 'package:bt_mobile/common/term_manager.dart';
import 'package:bt_mobile/common/weather_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../base/presenter.dart';
import '../constants/strings.dart';
import 'home_model.dart';
import 'home_view.dart';

class HomePresenter extends Presenter<HomeView, HomeModel> {
  HomePresenter() {
    model = HomeModel();
    setGreeting();
    setDates();
    setStats();
    setWeather();
  }

  final GetIt _getIt = GetIt.I;

  final DateTime _today = DateTime.now();
  final DateFormat _termFormat = DateFormat('MMMEd');
  final DateFormat _todayFormat = DateFormat('yMMMEd');

  DateTime _termStart = DateTime(2020, 1, 1);
  DateTime _termEnd = DateTime(2020, 12, 31);

  void setWeather() {
    final WeatherManager weatherManager = _getIt<WeatherManager>();
    final Tuple3<int, String, String> tempNameIcon =
        weatherManager.getWeatherInformation;
    if (tempNameIcon == null) {
      model.isThereWeatherData = false;
      return;
    }
    model.degrees = S.degreesC.replaceFirst(S.r, '${tempNameIcon.item1}');
    model.city = tempNameIcon.item2;
    model.weatherIconUrl = tempNameIcon.item3;
  }

  void setDates() {
    final TermManager termManager = _getIt<TermManager>();
    final TermDate termDate = termManager.getCurrentTermDate();

    // If the values are null, default to beginning and end of current year
    _termStart = termDate?.startDate ?? DateTime(_today.year, 1, 1);
    _termEnd = termDate?.endDate ?? DateTime(_today.year, 12, 31);

    model.term = termDate?.title ?? S.emptyTitle;
    model.date = _todayFormat.format(_today);
    model.startDate = _termFormat.format(_termStart);
    model.endDate = _termFormat.format(_termEnd);
  }

  void setStats() {
    final int todayDiff = _today.difference(_termStart).inDays;
    final int endDiff = _termEnd.difference(_termStart).inDays;

    final int numericDayDenominator = endDiff + 1;
    int numericDayNumerator = todayDiff + 1;
    if (numericDayNumerator > numericDayDenominator) {
      numericDayNumerator = numericDayDenominator;
    } else if (numericDayNumerator < 0) {
      numericDayNumerator = 0;
    }

    model.percentage = numericDayNumerator / numericDayDenominator;
    model.numericDayNumerator =
        S.dayNumerator.replaceFirst(S.r, '$numericDayNumerator');
    model.numericDayDenominator =
        S.dayDenominator.replaceFirst(S.r, '$numericDayDenominator');

    final int numericWeekDenominator =
        (endDiff + _termStart.weekday + (7 - _termEnd.weekday)) ~/ 7;
    int numericWeekNumerator =
        ((todayDiff + _termStart.weekday - 1) / 7).floor() + 1;
    if (numericWeekNumerator > numericWeekDenominator) {
      numericWeekNumerator = numericWeekDenominator;
    } else if (numericWeekNumerator < 0) {
      numericWeekNumerator = 0;
    }

    model.numericWeekNumerator =
        S.weekNumerator.replaceFirst(S.r, '$numericWeekNumerator');
    model.numericWeekDenominator =
        S.weekDenominator.replaceFirst(S.r, '$numericWeekDenominator');
  }

  void setGreeting() {
    if (_today.hour >= 4 && _today.hour < 12) {
      model.salutation = S.goodMorning;
    } else if (_today.hour >= 12 && _today.hour < 13) {
      model.salutation = S.goodDay;
    } else if (_today.hour >= 13 && _today.hour < 17) {
      model.salutation = S.goodAfternoon;
    } else {
      model.salutation = S.goodEvening;
    }
  }

  void setProgressWidth(double width) {
    final double old = model.topProgressWidth;
    model.topProgressWidth = model.percentage * width;
    if (old != model.topProgressWidth) {
      updateView();
    }
  }
}
