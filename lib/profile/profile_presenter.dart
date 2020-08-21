import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/login/login.dart';
import 'package:bt_mobile/login/login_presenter.dart';
import 'package:bt_mobile/member_info/member_info.dart';
import 'package:bt_mobile/member_info/member_info_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'profile_model.dart';
import 'profile_view.dart';

class ProfilePresenter extends Presenter<ProfileView, ProfileModel> {
  ProfilePresenter() {
    model = ProfileModel();
    model.firstName = user.firstName;
    model.lastName = user.lastName;
    model.faculty = user.faculty;
    model.studentId = user.studentId.toString();
    model.memberTitle = user.inviteCode != null && user.inviteCode.isNotEmpty
        ? S.profileIsMember
        : S.profileIsNotMember;
  }

  User user = GetIt.I<User>();
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

  void onEditProfilePressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewMember(NewMemberPresenter(isNew: false)),
        ));
  }

  Future signOutUser(BuildContext context) async {
    bool signOut = await GetIt.I<AuthenticationManager>().signOut(context);
    if (signOut) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Login(LoginPresenter())));
    }
  }
}
