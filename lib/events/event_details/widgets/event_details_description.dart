import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_widget_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class EventDetailsDescription extends StatelessWidget {
  const EventDetailsDescription({
    Key key,
    @required this.model,
  }) : super(key: key);

  final EventDetailsDescriptionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 70.0),
      child: Card(
        color: C.darkBackgroundCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: MarkdownBody(
            data: model.description,
            selectable: true,
            styleSheet: model.styleSheetFromTheme(Theme.of(context)),
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
