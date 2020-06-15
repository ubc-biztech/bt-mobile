import 'package:bt_mobile/constants/images.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/events.dart';
import 'package:bt_mobile/events/events_presenter.dart';
import 'package:bt_mobile/home/home.dart';
import 'package:bt_mobile/home/home_presenter.dart';
import 'package:bt_mobile/profile/profile.dart';
import 'package:bt_mobile/profile/profile_presenter.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../base/presenter.dart';
import 'main_model.dart';
import 'main_view.dart';

class MainPresenter extends Presenter<MainView, MainModel> {
  MainPresenter() {
    model = MainModel();
    _addPages();
  }

  void _addPages() {
    model.pages.add(Home(HomePresenter()));
    model.iconAndTitles
        .add(Tuple2(Image.asset(I.biztech65, height: 24.0), S.homeTitle));
    model.pages.add(Events(EventsPresenter()));
    model.iconAndTitles.add(Tuple2(Icon(Icons.calendar_today), S.eventsTitle));
    model.pages.add(Profile(ProfilePresenter()));
    model.iconAndTitles.add(Tuple2(Icon(Icons.person), S.profileTitle));
  }

  void onTabTapped(int index) {
    model.pageIndex = index;
    updateView();
  }
}
