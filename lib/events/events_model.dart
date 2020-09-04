import 'package:bt_mobile/base/model.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/widgets/event_card.dart';

class EventsModel extends Model {
  List<EventCardModel> eventCardModels = [];
  List<String> eventFilterModes = [
    S.eventsFilterAll,
    S.eventsFilterFavorites,
    S.eventsFilterRegistered,
    S.eventsFilterUpcoming,
    S.eventsFilterPast
  ];
  String selectedFilterMode = S.eventsFilterAll;
}
