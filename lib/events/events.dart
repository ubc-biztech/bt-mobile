import 'package:bt_mobile/events/widgets/event_card.dart';
import 'package:bt_mobile/events/widgets/events_greeting.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventsGreeting(model: model, presenter: widget.presenter),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: model.eventCardModels.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 6 : 0,
                    bottom: index == model.eventCardModels.length - 1 ? 12 : 0,
                  ),
                  child: EventCard(model.eventCardModels[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
