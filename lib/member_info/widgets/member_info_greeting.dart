import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class NewMemberGreeting extends StatelessWidget {
  const NewMemberGreeting({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final String title;
  final String description;

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
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: C.darkColor1,
            ),
          ),
          SizedBox(height: 11.0),
          AutoSizeText(
            description,
            maxLines: 4,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: C.darkColor2,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
