import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:bt_mobile/common/backend_request.dart';
import 'package:bt_mobile/common/events_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/landing/landing.dart';
import 'package:bt_mobile/landing/landing_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'form/form_model.dart';
import 'member_info_model.dart';
import 'member_info_view.dart';
import 'widgets/error_dialogs.dart';

class NewMemberPresenter extends Presenter<NewMemberView, NewMemberModel> {
  NewMemberPresenter({this.isNew = true}) {
    model = NewMemberModel();
    if (isNew) {
      model.title = S.newMemberTitle;
      model.description = S.newMemberDescription;
    } else {
      model.title = S.newMemberEditTitle;
      model.description = S.newMemberEditDescription;
    }
    addFormModels();
    _savedUserDetails = user.userDetails;
  }

  User user = GetIt.I<User>();
  bool isNew;
  Map<String, dynamic> _savedUserDetails;

  /// Resets all of [User]'s values to what they were before.
  ///
  /// When the user backs out of the form, we undo all of the changes by setting
  /// them to what they were before, saved in [_savedUserDetails]. We return
  /// [true] to notify the system that we are ok with backing out now.
  bool onWillPop() {
    user.updateUserDetailsFromMap(_savedUserDetails);
    return true;
  }

  /// Submits the information to the backend.
  ///
  /// [isNew] is used here to denote whether it should make a POST or PATCH
  /// request. Basically, POST if this is the first time user is submitting
  /// information, PATCH if it is modifying the information.
  ///
  /// Also, if the [EventsManager] did not run setup earlier, do it now.
  Future onSubmitButtonPressed(BuildContext context) async {
    if (!areUserFieldsValid()) {
      return;
    }
    AuthenticationManager authManager = GetIt.I<AuthenticationManager>();
    EventsManager eventsManager = GetIt.I<EventsManager>();
    if (!eventsManager.isSetup) {
      await eventsManager.setupEventsManager();
    }
    try {
      await authManager.submitUserDetails(context, isPost: isNew);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Landing(LandingPresenter(startPageIndex: isNew ? 0 : 2))));
    } catch (e) {
      bool isBadResponse = e is BadResponseError;
      if (isBadResponse && e.status == 404) {
        _show404Dialog(context);
      } else if (isBadResponse && e.status == 409) {
        _show409Dialog(context);
      } else {
        _showGeneralErrorDialog(context);
      }
    }
  }

  void _show404Dialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const FourOhFourDialog(),
    );
  }

  void _show409Dialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const FourOhNineDialog(),
    );
  }

  void _showGeneralErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const GeneralErrorDialog(),
    );
  }

  bool areUserFieldsValid() {
    return firstNameValidator(user.firstName) == null &&
        lastNameValidator(user.lastName) == null &&
        emailValidator(user.email) == null &&
        (_isStudentIdTouched || user.studentId != null) &&
        studentIdValidator('${user.studentId}') == null &&
        user.faculty != null &&
        user.year != null &&
        user.diet != null;
  }

  String firstNameValidator(String value) {
    if (value.isEmpty) {
      return S.newMemberFirstNameRequired;
    }
    return null;
  }

  String lastNameValidator(String value) {
    if (value.isEmpty) {
      return S.newMemberLastNameRequired;
    }
    return null;
  }

  String emailValidator(String value) {
    if (value.isEmpty) {
      return S.newMemberEmailRequired;
    } else {
      // https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
      bool isValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (!isValid) {
        return 'Valid email address is required';
      }
    }
    return null;
  }

  String studentIdValidator(String value) {
    if (!_isStudentIdTouched) {
      // Only show validation error after it has been modified.
      _isStudentIdTouched = true;
    } else if (value.isEmpty) {
      return 'Student number is required';
    } else if (int.tryParse(value) == null || value.length != 8) {
      return 'Valid student number is required';
    }
    return null;
  }

  void addFormModels() {
    model.formModels = [
      DisclaimerModel(),
      TextFieldModel(
        labelText: S.newMemberFirstName,
        validator: firstNameValidator,
        onChanged: (String newValue) {
          user.firstName = newValue;
          updateView();
        },
        initialValue: user.firstName,
      ),
      TextFieldModel(
        labelText: S.newMemberLastName,
        validator: lastNameValidator,
        onChanged: (String newValue) {
          user.lastName = newValue;
          updateView();
        },
        initialValue: user.lastName,
      ),
      TextFieldModel(
        labelText: S.newMemberEmail,
        validator: emailValidator,
        keyboardType: TextInputType.emailAddress,
        onChanged: (String newValue) {
          user.email = newValue;
          updateView();
        },
        initialValue: user.email,
        enabled: false,
      ),
      TextFieldModel(
        labelText: S.newMemberStudentId,
        validator: studentIdValidator,
        keyboardType: TextInputType.number,
        onChanged: (String newValue) {
          int value = int.tryParse(newValue) ?? -1;
          user.studentId = value;
          updateView();
        },
        initialValue: isNew ? '' : user.studentId.toString(),
        enabled: isNew,
      ),
      TextFieldModel(
        labelText: S.newMemberMembershipCode,
        onChanged: (String newValue) {
          user.inviteCode = newValue;
          updateView();
        },
        isRequired: false,
        initialValue: user.inviteCode,
      ),
      RadioFieldModel(
        labelText: S.newMemberFaculty,
        values: S.newMemberFacultyList,
        onChanged: (newValue) {
          user.faculty = newValue;
          updateView();
        },
        hasOther: true,
        onOtherSaved: (value) {
          user.faculty = value;
          updateView();
        },
        initialValue: user.faculty,
      ),
      RadioFieldModel(
        labelText: S.newMemberYear,
        values: S.newMemberYearList,
        onChanged: (newValue) {
          user.year = newValue;
          updateView();
        },
        initialValue: user.year,
      ),
      RadioFieldModel(
        labelText: S.newMemberDiet,
        values: S.newMemberDietList,
        onChanged: (newValue) {
          user.diet = newValue;
          updateView();
        },
        hasOther: true,
        onOtherSaved: (newValue) {
          user.diet = newValue;
          updateView();
        },
        initialValue: user.diet,
      ),
      RadioFieldModel(
        labelText: S.newMemberPronouns,
        values: S.newMemberPronounsList,
        onChanged: (newValue) {
          user.pronouns = newValue;
          updateView();
        },
        onOtherSaved: (value) {
          user.pronouns = value;
          updateView();
        },
        otherLabelText: S.newMemberPronounsOther,
        isRequired: false,
        hasOther: true,
        initialValue: user.pronouns,
      ),
      RadioFieldModel(
        labelText: S.newMemberHeardFrom,
        values: S.newMemberHeardFromList,
        onChanged: (newValue) {
          user.heardFrom = newValue;
          updateView();
        },
        hasOther: true,
        onOtherSaved: (value) {
          user.heardFrom = value;
          updateView();
        },
        isRequired: false,
        initialValue: user.heardFrom,
      ),
      SubmitButtonModel(
        isEnabled: areUserFieldsValid,
      ),
    ];
  }

  bool _isStudentIdTouched = false;
}
