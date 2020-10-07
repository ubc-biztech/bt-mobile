import 'dart:math';

import 'package:bt_mobile/base/presenter.dart';
import 'package:bt_mobile/common/backend_request.dart';
import 'package:bt_mobile/common/events_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/events/event_details/widgets/event_details_widget_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'event_details_model.dart';
import 'event_details_view.dart';

class EventDetailsPresenter
    extends Presenter<EventDetailsView, EventDetailsModel> {
  EventDetailsPresenter(this.event) {
    model = EventDetailsModel();
    model.title = event.name;
    model.imageUrl = event.imageUrl;
    model.getIsFavourite = () => _user.favoriteEventsId.contains(event.id);
    model.widgetModels = [
      EventDetailsTitleModel(
          greeting: _getGreeting,
          title: event.name,
          date: _formatStartDate(event.startDate)),
      EventDetailsDividerModel(),
      EventDetailsDescriptionModel(event.description ?? '', _customStyleSheet),
    ];
  }

  final User _user = GetIt.I<User>();
  final Event event;

  String _formatStartDate(String startDate) {
    DateTime dateTime = DateTime.parse(startDate);
    String date = DateFormat.yMMMMEEEEd().format(dateTime) +
        ', ' +
        DateFormat.jm().format(dateTime) +
        ' PST';
    return date;
  }

  String get _getGreeting {
    List<String> greetings = [
      S.eventDetailsGreetingInvites,
      S.eventDetailsGreetingJoinUs,
      S.eventDetailsGreetingPresents
    ];
    Random random = Random();
    int index = random.nextInt(greetings.length);
    return greetings[index];
  }

  Future onFavouriteButtonPressed() async {
    final String id = event.id;
    if (_user.favoriteEventsId.contains(id)) {
      _user.favoriteEventsId.remove(id);
    } else {
      _user.favoriteEventsId.add(id);
    }
    try {
      Fetcher().fetchBackend(
          '/users/favEvent/${_user.studentId}', FetcherMethod.patch, data: {
        'eventID': id,
        'isFavourite': _user.favoriteEventsId.contains(id)
      });
      updateView();
    } catch (e) {
      // If this fails, undo everything
      if (!_user.favoriteEventsId.contains(id)) {
        _user.favoriteEventsId.remove(id);
      } else {
        _user.favoriteEventsId.add(id);
      }
    }
  }

  void onRegisterButtonPressed(BuildContext context) {}

  MarkdownStyleSheet _customStyleSheet(ThemeData theme) {
    return MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: theme.textTheme.bodyText2,
      code: theme.textTheme.bodyText2.copyWith(
        color: C.darkColor3,
        fontFamily: 'monospace',
        fontSize: theme.textTheme.bodyText2.fontSize * 0.85,
      ),
      h1: theme.textTheme.headline5,
      h2: theme.textTheme.headline6,
      h3: theme.textTheme.subtitle1,
      h4: theme.textTheme.bodyText1,
      h5: theme.textTheme.bodyText1,
      h6: theme.textTheme.bodyText1,
      em: const TextStyle(fontStyle: FontStyle.italic),
      strong: const TextStyle(fontWeight: FontWeight.bold),
      del: const TextStyle(decoration: TextDecoration.lineThrough),
      blockquote: theme.textTheme.bodyText2.apply(color: Colors.black),
      img: theme.textTheme.bodyText2,
      checkbox: theme.textTheme.bodyText2.copyWith(
        color: theme.primaryColor,
      ),
      blockSpacing: 8.0,
      listIndent: 24.0,
      listBullet: theme.textTheme.bodyText2,
      tableHead: const TextStyle(fontWeight: FontWeight.w600),
      tableBody: theme.textTheme.bodyText2,
      tableHeadAlign: TextAlign.center,
      tableBorder: TableBorder.all(
        color: theme.dividerColor,
        width: 1,
      ),
      tableColumnWidth: const FlexColumnWidth(),
      tableCellsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      tableCellsDecoration: const BoxDecoration(),
      blockquotePadding: const EdgeInsets.all(8.0),
      blockquoteDecoration: BoxDecoration(
        color: C.darkColor3,
        borderRadius: BorderRadius.circular(2.0),
      ),
      codeblockPadding: const EdgeInsets.all(8.0),
      codeblockDecoration: BoxDecoration(
        color: C.darkBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 5.0,
            color: theme.dividerColor,
          ),
        ),
      ),
      // textScaleFactor:
    );
  }
}
