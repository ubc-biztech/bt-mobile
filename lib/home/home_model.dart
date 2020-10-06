import 'package:bt_mobile/base/model.dart';
import 'package:bt_mobile/common/events_manager.dart';

class HomeModel extends Model {
  String salutation = '';
  String date = '';
  String degrees = '';
  String city = '';
  String weatherIconUrl = 'http://malformed';
  bool isThereWeatherData = true;

  // Stats card
  double percentage = 0.0;
  double topProgressWidth = 0.0;
  String term = '';
  String startDate = '';
  String endDate = '';
  String numericDayNumerator = '';
  String numericDayDenominator = '';
  String numericWeekNumerator = '';
  String numericWeekDenominator = '';

  Event featuredEvent;
  String featuredEventStartDate = '';
  Event nextEvent;
  String nextEventStartDate = '';
}
