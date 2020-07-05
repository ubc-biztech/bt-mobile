import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class NewMemberGreeting extends StatelessWidget {
  const NewMemberGreeting({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 37.0),
          AutoSizeText(
            S.newMemberTitle,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: C.darkColor1,
            ),
          ),
          const SizedBox(height: 11.0),
          AutoSizeText(
            S.newMemberDescription,
            maxLines: 4,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: C.darkColor2,
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
