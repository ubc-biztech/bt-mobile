import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class EventDetailsDivider extends StatelessWidget {
  const EventDetailsDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Container(
        width: 1,
        height: 60,
        color: C.darkBackgroundCard,
      ),
    );
  }
}
