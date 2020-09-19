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
            FeaturedEvent(
              headline: 'Your Next Event',
              eventCardModel: EventCardModel(
                name: 'Some event',
                date: 'Some date',
                isFavorite: () => true,
                imageUrl:
                    'https://www.denverpost.com/wp-content/uploads/2016/09/jamal-murray.jpg',
                onCardPressed: () {},
                onFavoritePressed: (updateCard) {},
                fontSize: 20,
                imageAspectRatio: 16 * 1.5 / 9,
              ),
            ),
            Padding(
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
            FeaturedEvent(
              headline: 'Featured',
              eventCardModel: EventCardModel(
                name: 'Some event',
                date: 'Some date',
                isFavorite: () => true,
                imageUrl:
                    'https://www.denverpost.com/wp-content/uploads/2016/09/jamal-murray.jpg',
                onCardPressed: () {},
                onFavoritePressed: (updateCard) {},
                fontSize: 20,
                imageAspectRatio: 16 * 1.5 / 9,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
