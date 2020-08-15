import 'package:flutter/material.dart';

import 'profile_presenter.dart';
import 'profile_view.dart';
import 'widgets/profile_greeting.dart';
import 'widgets/profile_member_info.dart';

class Profile extends StatefulWidget {
  const Profile(this.presenter, {Key key}) : super(key: key);

  final ProfilePresenter presenter;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends ProfileView {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const ProfileGreeting(),
          MembershipCard(model: model),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
