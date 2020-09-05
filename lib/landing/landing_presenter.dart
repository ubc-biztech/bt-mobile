import 'package:bt_mobile/common/events_manager.dart';
import 'package:bt_mobile/constants/images.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/events.dart';
import 'package:bt_mobile/events/events_presenter.dart';
import 'package:bt_mobile/home/home.dart';
import 'package:bt_mobile/home/home_presenter.dart';
import 'package:bt_mobile/profile/profile.dart';
import 'package:bt_mobile/profile/profile_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

import '../base/presenter.dart';
import 'landing_model.dart';
import 'landing_view.dart';

class LandingPresenter extends Presenter<LandingView, LandingModel> {
  LandingPresenter({int startPageIndex = 0}) {
    model = LandingModel();
    model.pageIndex = startPageIndex;
    _addPages();
  }

  final EventsManager _eventsManager = GetIt.I<EventsManager>();

  /// Creates an [EventsPresenter] and registers it as an [EventsLoadListener]
  /// with the [EventsManager].
  EventsPresenter get _eventsPresenter {
    EventsPresenter eventsPresenter = EventsPresenter();
    _eventsManager.registerEventsLoadListener(eventsPresenter);
    return eventsPresenter;
  }

  void _addPages() {
    model.pages.add(Home(HomePresenter()));
    model.iconAndTitles
        .add(Tuple2(ImageIcon(AssetImage(I.biztech65)), S.homeTitle));
    model.pages.add(Events(_eventsPresenter));
    model.iconAndTitles.add(Tuple2(Icon(Icons.calendar_today), S.eventsTitle));
    model.pages.add(Profile(ProfilePresenter()));
    model.iconAndTitles.add(Tuple2(Icon(Icons.person), S.profileTitle));
    _eventsManager.setupEventsManager();
  }

  void onTabTapped(int index) {
    model.pageIndex = index;
    updateView();
  }
}
