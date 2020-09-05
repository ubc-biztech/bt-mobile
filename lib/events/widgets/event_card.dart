import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCardModel {
  EventCardModel(
      {@required this.name,
      @required this.date,
      @required this.imageUrl,
      @required this.isFavorite,
      @required this.onCardPressed,
      @required this.onFavoritePressed});

  String name;
  String date;
  String imageUrl;
  Function isFavorite;
  Function onCardPressed;
  Function(Function) onFavoritePressed;
}

class EventCard extends StatefulWidget {
  const EventCard(this.model);

  final EventCardModel model;

  @override
  State<StatefulWidget> createState() {
    return _EventCardState();
  }
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          color: C.darkBackgroundCard,
          child: Stack(
            children: [
              AspectRatio(
                child: CachedNetworkImage(
                  imageUrl: widget.model.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(C.darkColor1),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(),
                ),
                aspectRatio: 16 / 9,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.model.onCardPressed,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(aspectRatio: 16 / 9),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 14.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    widget.model.name,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      color: C.darkColor2,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  AutoSizeText(
                                    widget.model.date,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: C.darkColor3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.0),
                            InkWell(
                              onTap: () => widget.model
                                  .onFavoritePressed(() => setState(() {})),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  widget.model.isFavorite()
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: widget.model.isFavorite()
                                      ? C.darkColor1
                                      : C.darkColor2,
                                ),
                              ),
                              customBorder: CircleBorder(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
