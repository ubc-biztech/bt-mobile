import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/events_model.dart';
import 'package:bt_mobile/events/events_presenter.dart';
import 'package:bt_mobile/events/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsContent extends StatelessWidget {
  const EventsContent({
    Key key,
    @required this.model,
    @required this.presenter,
  }) : super(key: key);

  final EventsModel model;
  final EventsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: model.showLoading
          ? _EventsLoading()
          : _EventCards(
              model: model,
              presenter: presenter,
            ),
    );
  }
}

class _EventsLoading extends StatelessWidget {
  const _EventsLoading({
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

class _EventCards extends StatelessWidget {
  const _EventCards({
    Key key,
    @required this.model,
    @required this.presenter,
  }) : super(key: key);

  final EventsModel model;
  final EventsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: RefreshIndicator(
        onRefresh: presenter.onEventCardsRefresh,
        backgroundColor: C.darkBackgroundCard,
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
    );
  }
}
