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
    WeatherManager weatherManager = _getIt<WeatherManager>();
    Tuple3<int, String, String> tempNameIcon =
        weatherManager.getWeatherInformation;
    if (tempNameIcon == null) {
      model.isThereWeatherData = false;
      return;
    }
    model.degrees = S.homeDegreesC.replaceFirst(S.r, '${tempNameIcon.item1}');
    model.city = tempNameIcon.item2;
    model.weatherIconUrl = tempNameIcon.item3;
  }

  void setDates() {
    TermManager termManager = _getIt<TermManager>();
    TermDate termDate = termManager.getCurrentTermDate();

    // If the values are null, default to beginning and end of current year
    _termStart = termDate?.startDate ?? DateTime(_today.year, 1, 1);
    _termEnd = termDate?.endDate ?? DateTime(_today.year, 12, 31);

    model.term = termDate?.title ?? S.homeEmptyTitle;
    model.date = _todayFormat.format(_today);
    model.startDate = _termFormat.format(_termStart);
    model.endDate = _termFormat.format(_termEnd);
  }

  /// Sets the term stats that are shown in the first card.
  ///
  /// The reason we create [todayAtZeroHours] as opposed to just using
  /// [_today] is because the math requires dates at 0 hours, 0 seconds, and
  /// 0 milliseconds. Otherwise, our date logic will have to account for
  /// rounding those values, which is too complicated for me. We should probably
  /// unit test this method...
  void setStats() {
    DateTime todayAtZeroHours = DateTime(_today.year, _today.month, _today.day);
    int todayDiff = todayAtZeroHours.difference(_termStart).inDays;
    int endDiff = _termEnd.difference(_termStart).inDays;

    int numericDayDenominator = endDiff + 1;
    int numericDayNumerator = todayDiff + 1;
    if (numericDayNumerator > numericDayDenominator) {
      numericDayNumerator = numericDayDenominator;
    } else if (numericDayNumerator < 0) {
      numericDayNumerator = 0;
    }

    model.percentage = numericDayNumerator / numericDayDenominator;
    model.numericDayNumerator =
        S.homeDayNumerator.replaceFirst(S.r, '$numericDayNumerator');
    model.numericDayDenominator =
        S.homeDayDenominator.replaceFirst(S.r, '$numericDayDenominator');

    int numericWeekDenominator =
        (endDiff + _termStart.weekday + (7 - _termEnd.weekday)) ~/ 7;
    int numericWeekNumerator =
        ((todayDiff + _termStart.weekday - 1) / 7).floor() + 1;
    if (numericWeekNumerator > numericWeekDenominator) {
      numericWeekNumerator = numericWeekDenominator;
    } else if (numericWeekNumerator < 0) {
      numericWeekNumerator = 0;
    }

    model.numericWeekNumerator =
        S.homeWeekNumerator.replaceFirst(S.r, '$numericWeekNumerator');
    model.numericWeekDenominator =
        S.homeWeekDenominator.replaceFirst(S.r, '$numericWeekDenominator');
  }

  void setGreeting() {
    if (_today.hour >= 4 && _today.hour < 12) {
      model.salutation = S.homeGoodMorning;
    } else if (_today.hour >= 12 && _today.hour < 13) {
      model.salutation = S.homeGoodDay;
    } else if (_today.hour >= 13 && _today.hour < 17) {
      model.salutation = S.homeGoodAfternoon;
    } else {
      model.salutation = S.homeGoodEvening;
    }
  }

  void setProgressWidth(double width) {
    double old = model.topProgressWidth;
    model.topProgressWidth = model.percentage * width;
    if (old != model.topProgressWidth) {
      updateView();
    }
  }
}
