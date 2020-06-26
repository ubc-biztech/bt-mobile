import 'package:bt_mobile/common/auth_manager.dart';
import 'package:bt_mobile/login/login.dart';
import 'package:bt_mobile/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'profile_model.dart';
import 'profile_view.dart';

class ProfilePresenter extends Presenter<ProfileView, ProfileModel> {
  ProfilePresenter() {
    model = ProfileModel();
    printUserInfo();
  }

  Future printUserInfo() async {}

  Future signOutUser(BuildContext context) async {
    final bool signOut = await GetIt.I<AuthManager>().signOut(context);
    if (signOut) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Login(LoginPresenter())));
    }
  }
}
