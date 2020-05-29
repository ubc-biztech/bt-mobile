import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'home_model.dart';

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
            style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 11.0),
          AutoSizeText(
            model.date,
            maxLines: 1,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 47.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    shape: const CircleBorder(),
                    elevation: 2.0,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    model.degrees,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    model.city,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
