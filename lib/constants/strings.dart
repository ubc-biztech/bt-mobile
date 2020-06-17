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
  static const String homeTitle = 'Home';
  static const String homeDegreesC = '${S.r}°C';
  static const String homeDegreesF = '${S.r}°F';
  static const String homeGoodMorning = 'Good morning!';
  static const String homeGoodDay = 'Good day!';
  static const String homeGoodAfternoon = 'Good afternoon!';
  static const String homeGoodEvening = 'Good evening!';
  static const String homeDayNumerator = 'Day $r';
  static const String homeDayDenominator = ' / $r';
  static const String homeWeekNumerator = 'Week $r';
  static const String homeWeekDenominator = ' / $r';
  static const String homeEmptyTitle = 'What a year...';

  /// Events
  static const String eventsTitle = 'Events';
  static const String eventsDesc = 'This is where our events are listed!';

  /// Profile
  static const String profileTitle = 'Profile';
  static const String profileDesc =
      'This is where users can edit their profile!';

  /// Login
  static const String google_sign_in = 'Sign in with Google';
  static const String facebook_sign_in = 'Login with Facebook';
  static const String apple_sign_in = 'Sign in with Apple';
}
