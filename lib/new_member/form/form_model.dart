import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

abstract class FormModel {
  String labelText;
  bool isRequired;
}

class DisclaimerModel implements FormModel {
  @override
  String labelText = S.newMemberFormDisclaimer;

  @override
  bool isRequired = true;
}

class SubmitButtonModel implements FormModel {
  SubmitButtonModel({
    @required Function onPressed,
    @required this.isEnabled,
  }) {
    _onPressed = onPressed;
  }

  Function _onPressed;

  Function get onPressed => isEnabled() ? _onPressed : null;

  @override
  bool isRequired = true;

  @override
  String labelText = S.newMemberSubmit;

  bool Function() isEnabled;
}

class TextFieldModel implements FormModel {
  TextFieldModel({
    @required this.labelText,
    @required this.onChanged,
    this.enabled = true,
    this.validator,
    this.initialValue,
    this.keyboardType,
    this.isRequired = true,
  }) {
    if (isRequired) {
      labelText = '$labelText*';
    } else {
      labelText = '$labelText ${S.newMemberOptional}';
    }
  }

  FormFieldValidator<String> validator;
  ValueChanged<String> onChanged;
  String initialValue;
  bool enabled;
  TextInputType keyboardType;

  @override
  String labelText;

  @override
  bool isRequired;
}

class RadioFieldModel implements FormModel {
  RadioFieldModel({
    @required this.labelText,
    @required List<String> values,
    @required Function(String) onChanged,
    this.onOtherSaved,
    bool hasOther = false,
    this.isRequired = true,
  }) {
    int i = 0;
    this.values = values.map((value) => MapEntry(i++, value)).toList();
    if (hasOther) {
      this.values.add(MapEntry(i, S.newMemberOther));
      otherIndex = i;
    }
    _onChanged = onChanged;
    if (isRequired) {
      labelText = '$labelText*';
    } else {
      labelText = '$labelText ${S.newMemberOptional}';
    }
  }

  int radioValue;
  List<MapEntry<int, String>> values;
  Function(String) _onChanged;
  FormFieldSetter<String> onOtherSaved;
  int otherIndex = -1;

  void onChanged(int value) {
    radioValue = value;
    _onChanged(values[value].value);
  }

  void onOtherChanged(String value) {
    final MapEntry<int, String> keyValue = MapEntry(otherIndex, value);
    values.removeAt(otherIndex);
    values.insert(otherIndex, keyValue);
  }

  @override
  String labelText;

  @override
  bool isRequired;
}
