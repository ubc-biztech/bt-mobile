import 'package:bt_mobile/events/widgets/events_greeting.dart';
import 'package:flutter/material.dart';

import 'events_presenter.dart';
import 'events_view.dart';
import 'widgets/events_content.dart';

class Events extends StatefulWidget {
  const Events(this.presenter, {Key key}) : super(key: key);

  final EventsPresenter presenter;

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends EventsView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventsGreeting(model: model, presenter: widget.presenter),
        EventsContent(model: model),
      ],
    );
  }
}
