import 'dart:core';

import 'package:flutter/material.dart';

abstract class EventDetailsWidgetModel {}

class EventDetailsDividerModel extends EventDetailsWidgetModel {}

class EventDetailsTitleModel extends EventDetailsWidgetModel {
  EventDetailsTitleModel({
    @required this.title,
    @required this.date,
  });

  String title;
  String date;
}

class EventDetailsDescriptionModel extends EventDetailsWidgetModel {
  EventDetailsDescriptionModel(this.description, this.styleSheetFromTheme);

  String description;
  Function(ThemeData) styleSheetFromTheme;
}
