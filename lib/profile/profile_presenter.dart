import 'package:bt_mobile/common/authentication_manager.dart';
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
  }

  bool _isInitialized = false;

  void onInitState() {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
    _fetchProfile();
  }

  Future _fetchProfile() async {
    // do nothing for now
  }

  Future signOutUser(BuildContext context) async {
    final bool signOut =
        await GetIt.I<AuthenticationManager>().signOut(context);
    if (signOut) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Login(LoginPresenter())));
    }
  }
}
