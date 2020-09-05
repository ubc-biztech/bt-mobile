import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/events_model.dart';
import 'package:bt_mobile/events/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsContent extends StatelessWidget {
  const EventsContent({
    Key key,
    @required this.model,
  }) : super(key: key);

  final EventsModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: model.showLoading ? EventsLoading() : EventCards(model: model),
    );
  }
}

class EventsLoading extends StatelessWidget {
  const EventsLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(C.darkColor1),
        ),
      ),
    );
  }
}

class EventCards extends StatelessWidget {
  const EventCards({
    Key key,
    @required this.model,
  }) : super(key: key);

  final EventsModel model;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
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
    );
  }
}
