import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/profile/widgets/profile_sign_out.dart';
import 'package:bt_mobile/profile/widgets/profile_sign_out_dialog.dart';
import 'package:flutter/material.dart';

import 'profile_presenter.dart';
import 'profile_view.dart';
import 'widgets/profile_details/profile_details.dart';
import 'widgets/profile_greeting.dart';


class Profile extends StatefulWidget {
  const Profile(this.presenter, {Key key}) : super(key: key);

  final ProfilePresenter presenter;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends ProfileView {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ProfileGreeting(),
            ProfileDetailsCard(model: model),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                alignment: Alignment.center,
                child: Container(
                  height: 60,
                  width: 1.0,
                  color: C.darkBackgroundCard,
                ),
              ),
            ),
            //ProfileSignOut(onSignOutPressed: widget.presenter.onSignOutButtonPressed),
            ProfileSignOut(onSignOutPressed: widget.presenter.onSignOutButtonPressed),
            // ProfileSignOutDialog(onConfirmedPressed: widget.presenter.onConfirmButtonPressed),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
