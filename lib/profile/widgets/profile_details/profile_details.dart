import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/images.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/profile/widgets/profile_details/profile_details_model.dart';
import 'package:flutter/material.dart';

import '../../profile_model.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({Key key, @required this.model}) : super(key: key);

  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: C.darkBackgroundCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: model.detailsModels.map((infoModel) {
              if (infoModel is ProfileDetailsDetailModel) {
                return ProfileDetailsDetail(model: infoModel);
              } else if (infoModel is ProfileDetailsTitleModel) {
                return ProfileDetailsTitle(model: infoModel);
              } else if (infoModel is ProfileDetailsEditButtonModel) {
                return ProfileDetailsEditButton(model: infoModel);
              }
            }).toList(),
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

class ProfileDetailsEditButton extends StatelessWidget {
  const ProfileDetailsEditButton({
    Key key,
    @required this.model,
  }) : super(key: key);

  final ProfileDetailsEditButtonModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 26.0, left: 12, right: 12, bottom: 10),
      child: RaisedButton(
        color: C.darkColor1,
        child: Container(
          height: 50.0,
          constraints: const BoxConstraints(minWidth: double.infinity),
          alignment: Alignment.center,
          child: AutoSizeText(
            S.profileEditDetails,
            maxLines: 1,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => model.onEditButtonPressed(context),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
      ),
    );
  }
}

class ProfileDetailsTitle extends StatelessWidget {
  const ProfileDetailsTitle({@required this.model});

  final ProfileDetailsTitleModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 14.0),
        Container(
          width: 70,
          child: Image.asset(I.biztech65),
        ),
        SizedBox(height: 14.0),
        Container(
            height: 1.0,
            constraints: BoxConstraints(maxWidth: 200),
            color: C.darkColor3),
        SizedBox(height: 14.0),
        AutoSizeText(
          model.name,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: C.darkColor2,
          ),
        ),
      ],
    );
  }
}

class ProfileDetailsDetail extends StatelessWidget {
  const ProfileDetailsDetail({Key key, @required this.model}) : super(key: key);

  final ProfileDetailsDetailModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Row(
          children: [
            SizedBox(
              width: 24.0,
              child: model.icon,
            ),
            SizedBox(width: 12.0),
            AutoSizeText(
              model.title,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16.0,
                color: C.darkColor1,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            SizedBox(width: 36.0),
            Expanded(
              child: AutoSizeText(
                model.value,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: C.darkColor2,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Container(
          height: 1.0,
          constraints: BoxConstraints(minWidth: double.infinity),
          color: C.darkColor3,
          // If it's the last one, don't show the separation line
        ),
      ],
    );
  }
}
