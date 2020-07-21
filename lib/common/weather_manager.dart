import 'dart:convert';

import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class WeatherManager {
  /// Gets the OPEN_WEATHER_API_KEY key from our .env file and saves it to
  /// [_openWeatherApiKey].
  WeatherManager() : _openWeatherApiKey = DotEnv().env['OPEN_WEATHER_API_KEY'];

  SharedPreferences _preferences;
  final String _openWeatherApiKey;
  Tuple3<int, String, String> _tempNameIcon;
  static const _openWeatherApi =
      'http://api.openweathermap.org/data/2.5/weather?${S.r}&appid=${S.r}';
  static const _openWeatherIcon =
      'https://raw.githubusercontent.com/ubc-biztech/bt-app-content/master/weather-icons/${S.r}.png';

  static const _lastWeatherTimeStampKey = 'last_weather_time_stamp';
  static const _lastWeatherKey = 'last_weather';

  /// Get the [SharedPreferences] instance in preparation to get or save local
  /// data. Attempt to pull data from GitHub. If anything goes wrong, default to
  /// the data that was saved to the device. Return true if there is data to
  /// show. Return false if there is no data to show.
  Future<bool> setupWeatherManager() async {
    _preferences = await SharedPreferences.getInstance();
    bool progress = await _getWeatherTempNameIconFromApi();
    if (!progress) {
      progress = await _getWeatherTempNameIconFromPreferences();
    }
    if (!progress) {
      return false;
    }
    return true;
  }

  Tuple3<int, String, String> get getWeatherInformation => _tempNameIcon;

  /// Get and decode the existing weather data in device if it was collected
  /// three hours ago. Return true if it exists, return false if it doesn't.
  Future<bool> _getWeatherTempNameIconFromPreferences() async {
    if (!_preferences.containsKey(_lastWeatherTimeStampKey) ||
        !_preferences.containsKey(_lastWeatherKey)) {
      return false;
    }
    final int lastWeatherTimeStamp =
        _preferences.getInt(_lastWeatherTimeStampKey);
    final int lastWeatherPlusThreeHours =
        DateTime.fromMillisecondsSinceEpoch(lastWeatherTimeStamp)
            .add(const Duration(hours: 3))
            .millisecondsSinceEpoch;
    final int rightNow = DateTime.now().millisecondsSinceEpoch;
    if (rightNow >= lastWeatherTimeStamp &&
        rightNow <= lastWeatherPlusThreeHours) {
      try {
        final List<String> split = _preferences.getStringList(_lastWeatherKey);
        final int temperature = int.parse(split[0]);
        _tempNameIcon = Tuple3(temperature, split[1], split[2]);
      } catch (e) {
        return false;
      }
    }
    return true;
  }

  Future<bool> _getWeatherTempNameIconFromApi() async {
    final String url = _weatherApiUrl;
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String icon =
            _openWeatherIcon.replaceFirst(S.r, data['weather'][0]['icon']);
        final double tempDouble = data['main']['temp'];
        final int temp = (tempDouble - 273.15).round();
        final String name = data['name'];
        final List<String> split = ['$temp', name, icon];
        final int timeStamp = DateTime.now().millisecondsSinceEpoch;
        _preferences.setInt(_lastWeatherTimeStampKey, timeStamp);
        _preferences.setStringList(_lastWeatherKey, split);
        _tempNameIcon = Tuple3(temp, name, icon);
        return true;
      }
    } catch (e) {
      // do nothing
      print(e);
    }
    return false;
  }

  /// Defaults to Vancouver.
  String formatLatLonArgs({double lat = 49.24966, double lon = -123.119339}) {
    return 'lat=$lat&lon=$lon';
  }

  /// Have to make this customizable down the line.
  String get _weatherApiUrl {
    return _openWeatherApi
        .replaceFirst(S.r, formatLatLonArgs())
        .replaceFirst(S.r, _openWeatherApiKey);
  }
}
