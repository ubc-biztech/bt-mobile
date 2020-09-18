import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/events_model.dart';
import 'package:flutter/material.dart';

import '../events_presenter.dart';

class EventsGreeting extends StatelessWidget {
  const EventsGreeting({
    Key key,
    @required this.model,
    @required this.presenter,
  }) : super(key: key);

  final EventsModel model;
  final EventsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 37.0),
          AutoSizeText(
            S.eventsTitle,
            maxLines: 1,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: C.darkColor1,
            ),
          ),
          _FilterDropdownButton(model: model, presenter: presenter),
        ],
      ),
    );
  }
}

class _FilterDropdownButton extends StatefulWidget {
  const _FilterDropdownButton(
      {Key key, @required this.model, @required this.presenter})
      : super(key: key);

  final EventsModel model;
  final EventsPresenter presenter;

  @override
  _FilterDropdownButtonState createState() => _FilterDropdownButtonState();
}

class _FilterDropdownButtonState extends State<_FilterDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.model.selectedFilterMode,
      icon: Icon(
        Icons.arrow_drop_down,
        color: C.darkColor3,
      ),
      iconSize: 24,
      dropdownColor: C.darkBackgroundCard,
      elevation: 16,
      underline: Container(
        height: 2,
        color: C.darkColor3,
      ),
      onChanged: (String newMode) =>
          widget.presenter.onFilterDropdownItemChanged(newMode),
      items: widget.model.eventFilterModes
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: AutoSizeText(
                value,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: value == widget.model.selectedFilterMode
                      ? C.darkColor2
                      : C.darkColor3,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
