import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TermManager {
  static const _termDatesUrl =
      'https://raw.githubusercontent.com/ubc-biztech/bt-app-content/master/term-dates.json';
  static const _termDatesKey = 'term_dates_key';

  TermDates _termDates;
  SharedPreferences _preferences;

  /// Get the [SharedPreferences] instance in preparation to get or save local
  /// data. Attempt to pull data from GitHub, and if anything goes wrong,
  /// default to the data that was saved to the device. Return true if there is
  /// data to show. Return false if there is no data to show.
  Future<bool> setupTermManager() async {
    _preferences ??= await SharedPreferences.getInstance();
    bool progress = await getTermDatesFromGitHub();
    if (!progress) {
      progress = await getTermDatesFromPreferences();
    }
    if (!progress) {
      return false;
    }
    return true;
  }

  /// Iterates through all the terms in [_termDates] and returns the current
  /// term or reading break that today's date is within. We do date range checks
  /// using [DateTime.millisecondsSinceEpoch]. This is possible because of the
  /// date + 1 day - 1 ms logic in [TermDate._parseDateTime].
  TermDate getCurrentTermDate() {
    if (_termDates == null || _termDates.dates == null) {
      return null;
    }
    final int todayInMs = DateTime.now().millisecondsSinceEpoch;
    for (TermDate t in _termDates.dates) {
      if (todayInMs >= t.startDate.millisecondsSinceEpoch &&
          todayInMs <= t.endDate.millisecondsSinceEpoch) {
        if (t.readingBreak != null &&
            todayInMs >= t.readingBreak.startDate.millisecondsSinceEpoch &&
            todayInMs <= t.readingBreak.endDate.millisecondsSinceEpoch) {
          return t.readingBreak;
        }
        return t;
      }
    }
    return null;
  }

  /// Makes a GET request to the [_termDatesUrl]. Saves data locally and returns
  /// true if it responds successfully and with good data. Returns false if
  /// anything goes bad (bad network, bad response, bad data).
  Future<bool> getTermDatesFromGitHub() async {
    try {
      final http.Response response = await http.get(_termDatesUrl);
      if (response.statusCode == 200) {
        final TermDates termDates =
            TermDates.fromJson(json.decode(response.body));
        if (termDates != null) {
          _termDates = termDates;
          saveTermDatesToPreferences(response.body);
        }
        return true;
      }
    } catch (e) {
      // do nothing
    }
    return false;
  }

  /// Get and decode the existing term dates json data if it exists in device
  /// storage. Return true if it exists, return false if it doesn't.
  Future<bool> getTermDatesFromPreferences() async {
    if (!_preferences.containsKey(_termDatesKey)) {
      return false;
    }
    final String termDatesJson = _preferences.getString(_termDatesKey);
    if (termDatesJson == null || termDatesJson.isEmpty) {
      return false;
    }
    _termDates = TermDates.fromJson(json.decode(termDatesJson));
    return true;
  }

  /// Saves [json] to device storage. Returns true if the json data is different
  /// from what's already saved. Returns false if it's saving the same thing.
  Future<bool> saveTermDatesToPreferences(String json) async {
    if (_preferences.containsKey(_termDatesKey) &&
        _preferences.getString(_termDatesKey) == json) {
      return false;
    }
    await _preferences.setString(_termDatesKey, json);
    return true;
  }
}

class TermDates {
  TermDates({@required this.dates, @required this.dateRetrieved});

  factory TermDates.fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    }
    final List<TermDate> dates = json.map((termDate) {
      return TermDate.fromJson(Map<String, dynamic>.from(termDate));
    }).toList();
    if (dates.contains(null)) {
      return null;
    }
    final DateTime today = DateTime.now();
    return TermDates(dates: dates, dateRetrieved: today);
  }

  final List<TermDate> dates;
  final DateTime dateRetrieved;
}

class TermDate {
  TermDate(
      {@required this.startDate,
      @required this.endDate,
      @required this.title,
      @required this.readingBreak});

  factory TermDate.fromJson(Map<String, dynamic> json) {
    if (json == null ||
        !json.containsKey(_startDate) ||
        !json.containsKey(_endDate) ||
        !json.containsKey(_title)) {
      return null;
    }
    final DateTime startDate = _parseDateTime(json[_startDate]);
    final DateTime endDate = _parseDateTime(json[_endDate], isEndDate: true);
    final String title = json[_title];
    if (startDate == null || endDate == null || title == null) {
      return null;
    }
    TermDate readingBreak;
    if (json.containsKey(_readingBreak)) {
      readingBreak = TermDate.fromJson(json[_readingBreak]);
    }
    return TermDate(
        startDate: startDate,
        endDate: endDate,
        title: title,
        readingBreak: readingBreak);
  }

  static const String _startDate = 'startDate';
  static const String _endDate = 'endDate';
  static const String _title = 'title';
  static const String _readingBreak = 'readingBreak';

  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final TermDate readingBreak;

  /// Parses a date from an integer, such as 20201231. If it's the end date, we
  /// use this formula: date + 1 day - 1 ms. By incrementing the day and
  /// reducing it by a millisecond, we make the date fully inclusive. This
  /// reduces the complexity of date range conditions.
  static DateTime _parseDateTime(int date, {bool isEndDate = false}) {
    try {
      final int day = date % 100;
      final int month = date ~/ 100 % 100;
      final int year = date ~/ 10000;
      DateTime dateTime = DateTime(year, month, day);
      if (isEndDate) {
        dateTime = dateTime
            .add(const Duration(days: 1))
            .subtract(const Duration(milliseconds: 1));
      }
      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }
}
