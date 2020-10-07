import 'package:bt_mobile/common/backend_request.dart';
import 'package:bt_mobile/common/events_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/event_details/event_details.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../base/presenter.dart';
import 'event_details/event_details_presenter.dart';
import 'events_model.dart';
import 'events_view.dart';
import 'widgets/event_card.dart';

class EventsPresenter extends Presenter<EventsView, EventsModel>
    with EventsLoadListener {
  EventsPresenter() {
    model = EventsModel();
    filterEventsIntoCardModels();
  }

  final EventsManager _eventsManager = GetIt.I<EventsManager>();
  final User _user = GetIt.I<User>();

  Future<void> onEventCardsRefresh() async {
    _eventsManager.loadEvents();
  }

  void onFilterDropdownItemChanged(String newMode) {
    model.selectedFilterMode = newMode;
    filterEventsIntoCardModels();
    updateView();
  }

  /// Filters events from [EventsManager] and maps them into [EventCardModel].
  ///
  /// If the [EventsManager] is still loading, clear [model.eventCardModels] and
  /// do nothing.
  void filterEventsIntoCardModels() {
    model.eventCardModels = [];
    if (model.showLoading) {
      return;
    }
    List<Event> filteredEvents;
    if (model.selectedFilterMode == S.eventsFilterAll) {
      filteredEvents = _eventsManager.events
          .where((event) => _isDateStringValid(event.startDate))
          .toList();
    } else if (model.selectedFilterMode == S.eventsFilterFavorites) {
      filteredEvents = _eventsManager.events
          .where((event) => _user.favoriteEventsId.contains(event.id))
          .toList();
    } else if (model.selectedFilterMode == S.eventsFilterRegistered) {
      filteredEvents = _eventsManager.events
          .where((event) => _user.registeredEventsId.contains(event.id))
          .toList();
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
          name: event.name,
          date: date,
          isFavorite: () => _user.favoriteEventsId.contains(event.id),
          imageUrl: event.imageUrl,
          onCardPressed: (context, updateCard) =>
              _onEventCardPressed(context, event, updateCard),
          onFavoritePressed: (updateCard) =>
              _onFavoritePressed(event.id, updateCard));
    }).toList();
  }

  Future _onEventCardPressed(
      BuildContext context, Event event, Function updateCard) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetails(EventDetailsPresenter(event)),
        ));
    updateCard();
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

  @override
  void onLoadFinished() {
    model.showLoading = false;
    filterEventsIntoCardModels();
    updateView();
  }

  @override
  void onLoadStart() {
    model.showLoading = true;
    filterEventsIntoCardModels();
    updateView();
  }
}
