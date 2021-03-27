import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_collapsing_header.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_divider.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_widget_models.dart';
import 'package:flutter/material.dart';

import 'event_details_presenter.dart';
import 'event_details_view.dart';
import 'widgets/event_details_description.dart';
import 'widgets/event_details_title.dart';

class EventDetails extends StatefulWidget {
  const EventDetails(this.presenter, {Key key}) : super(key: key);

  final EventDetailsPresenter presenter;

  @override
  State<StatefulWidget> createState() => _EventDetailsState();
}

class _EventDetailsState extends EventDetailsView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.darkBackground,
      body: SafeArea(
        child: Scrollbar(
          child: CustomScrollView(
            slivers: <Widget>[
              EventDetailsCollapsingHeader(
                model: model,
                presenter: widget.presenter,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    EventDetailsWidgetModel widgetModel =
                        model.widgetModels[index];
                    if (widgetModel is EventDetailsTitleModel) {
                      return EventDetailsTitle(model: widgetModel);
                    } else if (widgetModel is EventDetailsDescriptionModel) {
                      return EventDetailsDescription(model: widgetModel);
                    } else if (widgetModel is EventDetailsDividerModel) {
                      return EventDetailsDivider();
                    }
                    return Container();
                  },
                  childCount: model.widgetModels.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(4.0),
              backgroundColor: MaterialStateProperty.all<Color>(C.darkColor1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
              )),
          child: AutoSizeText(
            S.eventDetailsRegister,
            maxLines: 1,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => widget.presenter.onRegisterButtonPressed(context),
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
