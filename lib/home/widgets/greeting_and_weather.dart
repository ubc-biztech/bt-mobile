import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../home_model.dart';

class GreetingAndWeather extends StatelessWidget {
  const GreetingAndWeather({
    Key key,
    @required this.model,
  }) : super(key: key);

  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 37.0),
          AutoSizeText(
            model.salutation,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: C.darkColor1,
            ),
          ),
          const SizedBox(height: 11.0),
          AutoSizeText(
            model.date,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: C.darkColor2,
            ),
          ),
          const SizedBox(height: 16.0),
          _weather,
          const SizedBox(height: 18.0),
        ],
      ),
    );
  }

  Widget get _weather {
    if (!model.isThereWeatherData) {
      return Container(
        height: 2.0,
      );
    }
    return SizedBox(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(C.darkColor2, BlendMode.srcATop),
              child: CachedNetworkImage(
                imageUrl: model.weatherIconUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              model.degrees,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: C.darkColor2,
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              model.city,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: C.darkColor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
