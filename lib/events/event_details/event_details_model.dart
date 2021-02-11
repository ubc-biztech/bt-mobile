import 'package:bt_mobile/base/model.dart';

import 'widgets/event_details_widget_models.dart';

class EventDetailsModel extends Model {
  String title;
  List<EventDetailsWidgetModel> widgetModels;
  Function getIsFavourite;
  String imageUrl;
}
