class S {
  static const String title = 'Hi, welcome to BizTech mobile!';

  /// Whenever we have dynamic text in a string, we put this in its place so
  /// that we can just replace it.
  ///
  /// ie.
  /// static const String thisIsSomeText = 'This is $r';
  /// ...
  /// String someText = 'some text';
  /// String ourText = S.thisIsSomeNumber.replaceFirst(S.r, someText);
  static const String r = 'REPLACE_ME_PLZ';

  /// Home
  static const String goodMorning = 'Good morning!';
  static const String goodDay = 'Good day!';
  static const String goodAfternoon = 'Good afternoon!';
  static const String goodEvening = 'Good evening!';
  static const String dayNumerator = 'Day $r';
  static const String dayDenominator = ' / $r';
  static const String weekNumerator = 'Week $r';
  static const String weekDenominator = ' / $r';
}
