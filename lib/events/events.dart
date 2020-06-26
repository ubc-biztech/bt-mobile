import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

import 'events_presenter.dart';
import 'events_view.dart';

class Events extends StatefulWidget {
  const Events(this.presenter, {Key key}) : super(key: key);

  final EventsPresenter presenter;

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends EventsView {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          S.eventsDesc,
          style: TextStyle(color: C.darkColor2),
        ),
      ),
    );
  }
}
