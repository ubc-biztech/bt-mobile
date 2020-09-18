import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class ProfileGreeting extends StatelessWidget {
  const ProfileGreeting({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 37.0),
          AutoSizeText(
            S.profileTitle,
            maxLines: 1,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: C.darkColor1,
            ),
          ),
//          SizedBox(height: 11.0),
//          BizBotPet(),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
