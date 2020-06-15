import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

import 'profile_presenter.dart';
import 'profile_view.dart';

class Profile extends StatefulWidget {
  const Profile(this.presenter, {Key key}) : super(key: key);

  final ProfilePresenter presenter;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends ProfileView {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          S.profileDesc,
          style: TextStyle(color: C.darkColor2),
        ),
      ),
    );
  }
}
