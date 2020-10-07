import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/events/event_details/event_details_presenter.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

import '../event_details_model.dart';

class EventDetailsCollapsingHeader extends StatelessWidget {
  const EventDetailsCollapsingHeader({
    Key key,
    @required this.model,
    @required this.presenter,
  }) : super(key: key);

  final EventDetailsModel model;
  final EventDetailsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: C.darkBackgroundCard,
      expandedHeight: 250.0,
      leading: IconButton(
        icon: IconShadowWidget(
          Icon(Icons.chevron_left, color: C.darkColor2),
          shadowColor: Colors.black,
        ),
        onPressed: () => Navigator.maybePop(context),
      ),
      actions: [
        IconButton(
          icon: IconShadowWidget(
            Icon(
              model.getIsFavourite() ? Icons.star : Icons.star_border,
              color: model.getIsFavourite() ? C.darkColor1 : C.darkColor2,
            ),
            shadowColor: Colors.black,
          ),
          onPressed: presenter.onFavouriteButtonPressed,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.only(
          bottom: 16.0,
          left: 20.0,
          right: 28.0,
        ),
        title: Container(),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              model.imageUrl,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
