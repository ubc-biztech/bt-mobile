import 'package:bt_mobile/common/backend_request.dart';
import 'package:bt_mobile/common/events_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../base/presenter.dart';
import 'events_model.dart';
import 'events_view.dart';
import 'widgets/event_card.dart';

class EventsPresenter extends Presenter<EventsView, EventsModel> {
  EventsPresenter() {
    model = EventsModel();
    filterEventsIntoCardModels();
  }

  final EventsManager _eventsManager = GetIt.I<EventsManager>();
  final User _user = GetIt.I<User>();

  void onFilterDropdownItemChanged(String newMode) {
    model.selectedFilterMode = newMode;
    filterEventsIntoCardModels();
    updateView();
  }

  void filterEventsIntoCardModels() {
    model.eventCardModels = [];
    List<Event> filteredEvents;
    if (model.selectedFilterMode == S.eventsFilterAll) {
      filteredEvents = _eventsManager.events
          .where((event) => _isDateStringValid(event.startDate))
          .toList();
    } else if (model.selectedFilterMode == S.eventsFilterFavorites) {
      filteredEvents = [];
    } else if (model.selectedFilterMode == S.eventsFilterRegistered) {
      filteredEvents = [];
    } else if (model.selectedFilterMode == S.eventsFilterUpcoming) {
      filteredEvents = _eventsManager.events
          .where((event) =>
              _isDateStringValid(event.startDate) &&
              DateTime.parse(event.startDate).millisecondsSinceEpoch >=
                  DateTime.now().millisecondsSinceEpoch)
          .toList();
    } else if (model.selectedFilterMode == S.eventsFilterPast) {
      filteredEvents = _eventsManager.events
          .where((event) =>
              _isDateStringValid(event.startDate) &&
              DateTime.parse(event.startDate).millisecondsSinceEpoch <
                  DateTime.now().millisecondsSinceEpoch)
          .toList();
    }
    filteredEvents.sort((event1, event2) =>
        DateTime.parse(event2.startDate).millisecondsSinceEpoch -
        DateTime.parse(event1.startDate).millisecondsSinceEpoch);
    model.eventCardModels = filteredEvents.map((event) {
      DateTime startDate = DateTime.parse(event.startDate);
      String date = DateFormat.yMMMEd().format(startDate);
      return EventCardModel(
          id: event.id,
          name: event.name,
          date: date,
          isFavorite: () => _user.favoriteEventsId.contains(event.id),
          imageUrl: event.imageUrl,
          onFavoritePressed: (updateCard) =>
              _onFavoritePressed(event.id, updateCard));
    }).toList();
  }

  Future _onFavoritePressed(String id, Function updateCard) async {
    if (_user.favoriteEventsId.contains(id)) {
      _user.favoriteEventsId.remove(id);
    } else {
      _user.favoriteEventsId.add(id);
    }
    try {
      Fetcher().fetchBackend(
          '/users/favEvent/${_user.studentId}', FetcherMethod.patch, data: {
        'eventID': id,
        'isFavourite': _user.favoriteEventsId.contains(id)
      });
      updateCard();
    } catch (e) {
      // If this fails, undo everything
      if (!_user.favoriteEventsId.contains(id)) {
        _user.favoriteEventsId.remove(id);
      } else {
        _user.favoriteEventsId.add(id);
      }
    }
  }

  bool _isDateStringValid(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }
}
