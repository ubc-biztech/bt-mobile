import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FeaturedEvent extends StatelessWidget {
  const FeaturedEvent({
    Key key,
    @required this.headline,
    @required this.eventCardModel,
  }) : super(key: key);

  final String headline;
  final EventCardModel eventCardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Container(
            child: AutoSizeText(
              headline,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: C.darkColor1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            SizedBox(width: 17),
            Container(
              height: 60,
              width: 1.0,
              color: C.darkBackgroundCard,
            ),
            SizedBox(width: 13),
            Expanded(
              child: EventCard(eventCardModel),
            ),
            SizedBox(width: 13),
            Container(
              height: 60,
              width: 1.0,
              color: C.darkBackgroundCard,
            ),
            SizedBox(width: 17),
          ],
        ),
      ],
    );
  }
}
