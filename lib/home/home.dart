import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/widgets/event_card.dart';
import 'package:flutter/material.dart';

import 'home_presenter.dart';
import 'home_view.dart';
import 'widgets/featured_event.dart';
import 'widgets/greeting_and_weather.dart';
import 'widgets/term_stats/term_stats.dart';

class Home extends StatefulWidget {
  const Home(this.presenter, {Key key}) : super(key: key);

  final HomePresenter presenter;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends HomeView {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GreetingAndWeather(model: model),
            TermStats(model: model, widget: widget),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                alignment: Alignment.center,
                child: Container(
                  height: 60,
                  width: 1.0,
                  color: C.darkBackgroundCard,
                ),
              ),
            ),
            if (model.nextEvent != null) FeaturedEvent(
              headline: 'Your Next Event',
              eventCardModel: EventCardModel(
                name: model.nextEvent.name,
                date: model.nextEventStartDate,
                isFavorite: () => true,
                imageUrl:
                    model.nextEvent.imageUrl,
                onCardPressed: () {},
                onFavoritePressed: (updateCard) {},
                fontSize: 20,
                imageAspectRatio: 16 * 1.5 / 9,
              ),
            ),
            if (model.nextEvent != null) Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: 1.0,
                  color: C.darkBackgroundCard,
                ),
              ),
            ),
            if (model.featuredEvent != null) FeaturedEvent(
              headline: 'Featured',
              eventCardModel: EventCardModel(
                name: model.featuredEvent.name,
                date: model.featuredEventStartDate,
                isFavorite: () => true,
                imageUrl: model.featuredEvent.imageUrl,
                onCardPressed: () {},
                onFavoritePressed: (updateCard) {},
                fontSize: 20,
                imageAspectRatio: 16 * 1.5 / 9,
              ),
            ) else Container(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
