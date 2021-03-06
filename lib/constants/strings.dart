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
  static const String eventsFilterAll = 'All';
  static const String eventsFilterFavorites = 'Favorites';
  static const String eventsFilterRegistered = 'Registered';
  static const String eventsFilterUpcoming = 'Upcoming';
  static const String eventsFilterPast = 'Past';

  /// Event Details
  static const String eventDetailsRegister = 'Register';
  static const String eventDetailsGreetingPresents = 'UBC BizTech presents...';
  static const String eventDetailsGreetingInvites =
      'UBC BizTech invites you to...';
  static const String eventDetailsGreetingJoinUs = 'Join UBC BizTech at...';

  /// Profile
  static const String profileTitle = 'Profile';
  static const String profileDesc =
      'This is where users can edit their profile!';
  static const String profileIsMember = 'Member';
  static const String profileIsNotMember = 'Non-member';
  static const String profileMemberInfoTitle = 'Your Details';
  static const String profileEditDetails = 'Edit details';
  static const String profileSignOut = 'Sign out';
  static const String confirmSignOutTitle = 'Sign Out';
  static const String confirmSignOutDescription =
      'Are you sure you want to sign out?';
  static const String confirmSignOutButton = 'Confirm';
  static const String confirmSignOutCancelButton = 'Cancel';

  /// Tamagotchi
  static const String tamagotchiTitle = 'Tamagotchi';

  /// Login
  static const String loginWelcome = 'Welcome!';
  static const String loginSalutation =
      'Glad you could join us,\nsign in to continue.';
  static const String loginGoogle = 'Sign in with Google';
  static const String loginFacebook = 'Login with Facebook';
  static const String loginApple = 'Sign in with Apple';

  /// NewMember
  static const String newMemberTitle = 'Member Details';
  static const String newMemberDescription =
      'Thanks for signing in! Your information helps us do our best to '
      'accommodate your needs and improve our future events.';
  static const String newMemberEditTitle = 'Edit Details';
  static const String newMemberEditDescription =
      'Thanks for keeping your details updated! This helps us do our best to '
      'accommodate your needs and improve our future events.';
  static const String newMemberOther = 'Other';
  static const String newMemberOptional = '(Optional)';
  static const String newMemberSubmit = 'Submit';
  static const String newMemberFormDisclaimer =
      'All fields marked with an asterisk (*) are required.';

  static const String newMember404ErrorTitle = 'Uh oh...';
  static const String newMember404Error =
      'Thanks for submitting your information! Unfortunately, we weren\'t able '
      'to verify your membership code. Please double check your code.';
  static const String newMember404Button = 'Okay';
  static const String newMember409ErrorTitle = 'Uh oh...';
  static const String newMember409Error = 'Unfortunately, an account with '
      'this student number has already been registered. Sign in with that '
      'account to continue or contact the UBC BizTech team for further help.';
  static const String newMember409Button = 'Okay';
  static const String newMemberErrorTitle = 'Uh oh...';
  static const String newMemberError = 'Something went wrong! Are you '
      'connected to the internet? Contact the UBC BizTech development team '
      '(dev@ubcbiztech.com) if this issue persists.';
  static const String newMemberButton = 'Try again';

  // First name
  static const String newMemberFirstName = 'First Name';
  static const String newMemberFirstNameRequired = 'First name is required';

  // Last name
  static const String newMemberLastName = 'Last Name';
  static const String newMemberLastNameRequired = 'Last name is required';

  // Email
  static const String newMemberEmail = 'Email Address';
  static const String newMemberEmailRequired = 'Email address is required';
  static const String newMemberValidEmailRequired =
      'Valid email address is required';

  // Student ID
  static const String newMemberStudentId = 'Student Number';
  static const String newMemberStudentIdRequired = 'Student number is required';
  static const String newMemberValidStudentIdRequired =
      'Valid student number is required';

  // Membership
  static const String newMemberMembershipCode = 'Membership Code';

  // Faculty
  static const String newMemberFaculty = 'Faculty';
  static const String newMemberFacultyArts = 'Arts';
  static const String newMemberFacultyCommerce = 'Commerce';
  static const String newMemberFacultyScience = 'Science';
  static const String newMemberFacultyEngineering = 'Engineering';
  static const String newMemberFacultyKinesiology = 'Kinesiology';
  static const String newMemberFacultyLfs = 'Land and Food Systems';
  static const String newMemberFacultyForestry = 'Forestry';
  static const List<String> newMemberFacultyList = [
    S.newMemberFacultyArts,
    S.newMemberFacultyCommerce,
    S.newMemberFacultyScience,
    S.newMemberFacultyEngineering,
    S.newMemberFacultyKinesiology,
    S.newMemberFacultyLfs,
    S.newMemberFacultyForestry,
  ];

  // Year
  static const String newMemberYear = 'Level of Study';
  static const String newMember1Year = '1st Year';
  static const String newMember2Year = '2nd Year';
  static const String newMember3Year = '3rd Year';
  static const String newMember4Year = '4th Year';
  static const String newMember5PlusYear = '5+ Year';
  static const List<String> newMemberYearList = [
    S.newMember1Year,
    S.newMember2Year,
    S.newMember3Year,
    S.newMember4Year,
    S.newMember5PlusYear,
  ];

  // Diet
  static const String newMemberDiet = 'Dietary Restrictions';
  static const String newMemberDietNone = 'None';
  static const String newMemberDietVegetarian = 'Vegetarian';
  static const String newMemberDietVegan = 'Vegan';
  static const String newMemberDietGlutenFree = 'Gluten Free';
  static const List<String> newMemberDietList = [
    S.newMemberDietNone,
    S.newMemberDietVegetarian,
    S.newMemberDietVegan,
    S.newMemberDietGlutenFree,
  ];

  // Pronouns
  static const String newMemberPronouns = 'Pronouns';
  static const String newMemberPronounsMale = 'He/Him/His';
  static const String newMemberPronounsFemale = 'She/Her/Hers';
  static const String newMemberPronounsThem = 'They/Them/Their';
  static const String newMemberPronounsOther = 'Other/Prefer not to say';
  static const List<String> newMemberPronounsList = [
    S.newMemberPronounsMale,
    S.newMemberPronounsFemale,
    S.newMemberPronounsThem,
  ];

  // Heard from
  static const String newMemberHeardFrom =
      'How did you hear about UBC BizTech?';
  static const String newMemberHeardFromFacebook = 'Facebook';
  static const String newMemberHeardFromBoothing = 'Boothing';
  static const String newMemberHeardFromFriends = 'Friends';
  static const String newMemberHeardFromBizTechNewsletter =
      'BizTech Newsletter';
  static const String newMemberHeardFromFacultyNewsletter =
      'Faculty Newsletter';
  static const List<String> newMemberHeardFromList = [
    S.newMemberHeardFromFacebook,
    S.newMemberHeardFromBoothing,
    S.newMemberHeardFromFriends,
    S.newMemberHeardFromBizTechNewsletter,
    S.newMemberHeardFromFacultyNewsletter,
  ];

  static const String markdownExample = '# An exhibit of Markdown'
      '\n\nThis note demonstrates some of what [Markdown][1] is capable of doing.'
      '\n\n*Note: Feel free to play with this page. Unlike regular notes, this doesn\'t automatically save itself.*'
      '\n\n## Basic formatting'
      '\n\nParagraphs can be written like so. A paragraph is the basic block of Markdown. A paragraph is what text will turn into when there is no reason it should become anything else.'
      '\n\nParagraphs must be separated by a blank line. Basic formatting of *italics* and **bold** is supported. This *can be **nested** like* so.'
      '\n\n## Lists'
      '\n\n### Ordered list'
      '\n\n1. Item 1\n2. A second item\n3. Number 3\n4. Ⅳ'
      '\n\n*Note: the fourth item uses the Unicode character for [Roman numeral four][2].*'
      '\n\n### Unordered list'
      '\n\n* An item\n* Another item\n* Yet another item\n* And there\'s more...'
      '\n\n### Code block'
      '\n\nYou can also make `inline code` to add code into other things.'
      '\n\n> Here is a quote. What this is should be self explanatory. Quotes are automatically indented when they are used.'
      '\n\n### Headings *can* also contain **formatting**'
      '\n\n### They can even contain `inline code`'
      '\n\n* A named link to [MarkItDown][3]. The easiest way to do these is to select what you want to make a link and hit `Ctrl+L`.'
      '\n* Another named link to [MarkItDown](http://www.markitdown.net/)'
      '\n* Sometimes you just want a URL like <http://www.markitdown.net/>.'
      '\n---'
      '\n\n__This is bold text__'
      '\n\n~~Strikethrough~~'
      '\n\n> Blockquotes can also be nested...'
      '\n>> ...by using additional greater-than signs right next to each other...'
      '\n> > > ...or with spaces between arrows.'
      '\n\n``` js'
      '\nvar foo = function (bar) {'
      '\n  return bar++;'
      '\n};'
      '\nconsole.log(foo(5));'
      '\n```'
      '\n\nUnordered'
      '\n\n+ Create a list by starting a line with `+`, `-`, or `*`'
      '\n+ Sub-lists are made by indenting 2 spaces:'
      '\n  - Marker character change forces new list start:'
      '\n    * Ac tristique libero volutpat at'
      '\n    + Facilisis in pretium nisl aliquet'
      '\n    - Nulla volutpat aliquam velit'
      '\n+ Very easy!';
}
