import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_widget_models.dart';
import 'package:flutter/material.dart';

class EventDetailsTitle extends StatelessWidget {
  const EventDetailsTitle({
    Key key,
    @required this.model,
  }) : super(key: key);

  final EventDetailsTitleModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
      child: Card(
        color: C.darkBackgroundCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                model.title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: C.darkColor1,
                ),
              ),
              SizedBox(height: 10),
              AutoSizeText(
                model.date,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: C.darkColor2,
                ),
              ),
            ],
          ),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 4,
      ),
    );
  }
}
