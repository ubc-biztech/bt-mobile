import 'package:flutter/material.dart';

class ProfileDetailsModel {}

class ProfileDetailsTitleModel extends ProfileDetailsModel {
  ProfileDetailsTitleModel({@required this.name});

  final String name;
}

class ProfileDetailsDetailModel extends ProfileDetailsModel {
  ProfileDetailsDetailModel({
    @required this.icon,
    @required this.title,
    @required this.value,
  });

  final Icon icon;
  final String title;
  final String value;
}

class ProfileDetailsEditButtonModel extends ProfileDetailsModel {
  ProfileDetailsEditButtonModel({
    @required this.onEditButtonPressed,
  });

  final Function onEditButtonPressed;
}
