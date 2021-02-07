import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/login/login.dart';
import 'package:bt_mobile/login/login_presenter.dart';
import 'package:bt_mobile/member_info/member_info.dart';
import 'package:bt_mobile/member_info/member_info_presenter.dart';
import 'package:bt_mobile/profile/widgets/profile_sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'profile_model.dart';
import 'profile_view.dart';
import 'widgets/profile_details/profile_details_model.dart';

class ProfilePresenter extends Presenter<ProfileView, ProfileModel> {
  ProfilePresenter() {
    model = ProfileModel();
    model.detailsModels = [
      ProfileDetailsTitleModel(name: '${user.firstName} ${user.lastName}'),
      ProfileDetailsDetailModel(
          icon: Icon(Icons.email, color: C.darkColor1),
          title: S.newMemberEmail,
          value: user.email),
      ProfileDetailsDetailModel(
          icon: Icon(Icons.perm_identity, color: C.darkColor1),
          title: S.newMemberStudentId,
          value: user.studentId.toString()),
      ProfileDetailsDetailModel(
          icon: Icon(Icons.border_color, color: C.darkColor1),
          title: S.newMemberFaculty,
          value: user.faculty),
      ProfileDetailsDetailModel(
          icon: Icon(Icons.show_chart, color: C.darkColor1),
          title: S.newMemberYear,
          value: user.year),
      ProfileDetailsEditButtonModel(onEditButtonPressed: onEditProfilePressed),
    ];

    model.firstName = user.firstName;
    model.lastName = user.lastName;
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

  Future onConfirmButtonPressed(BuildContext context) async {
    bool signOut = await GetIt.I<AuthenticationManager>().signOut(context);
    if (signOut) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Login(LoginPresenter())));
    }
  }

  void onSignOutButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          ProfileSignOutDialog(onConfirmedPressed: onConfirmButtonPressed),
    );
  }
}
