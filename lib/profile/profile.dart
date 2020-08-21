import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
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
          EditProfileButton(
            onEditProfileButtonPressed: widget.presenter.onEditProfilePressed,
          ),
          SignOutButton(
            onSignOutButtonPressed: widget.presenter.signOutUser,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key key,
    @required this.onEditProfileButtonPressed,
  }) : super(key: key);

  final Function onEditProfileButtonPressed;

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
            'Edit profile',
            maxLines: 1,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => onEditProfileButtonPressed(context),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key key,
    @required this.onSignOutButtonPressed,
  }) : super(key: key);

  final Function onSignOutButtonPressed;

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
            'Sign out',
            maxLines: 1,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => onSignOutButtonPressed(context),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
