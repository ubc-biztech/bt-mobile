import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/images.dart';
import 'package:flutter/material.dart';

import '../profile_model.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    Key key,
    @required this.model,
  }) : super(key: key);

  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: C.darkBackgroundCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: AspectRatio(
            aspectRatio: 85.6 / 53.98,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 24.0),
                SizedBox(
                  width: 40,
                  child: Image.asset(I.biztech65),
                ),
                SizedBox(height: 16.0),
                AutoSizeText(
                  '${model.firstName} ${model.lastName}',
                  maxLines: 1,
                  style: const TextStyle(
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    color: C.darkColor2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 7.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    height: 1.0,
                    color: C.darkColor2,
                  ),
                ),
                AutoSizeText(
                  model.studentId,
                  maxLines: 1,
                  style: const TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 18.0,
                    color: C.darkColor2,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      model.faculty,
                      maxLines: 1,
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 16.0,
                        color: C.darkColor2,
                      ),
                    ),
                    AutoSizeText(
                      model.memberTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 16.0,
                        color: C.darkColor2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 4,
      ),
    );
  }
}
