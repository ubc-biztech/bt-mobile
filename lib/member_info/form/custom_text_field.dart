import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

import 'form_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.model,
  }) : super(key: key);

  final TextFieldModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: model.labelText,
          labelStyle: const TextStyle(
            color: C.darkColor3,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextStyle(
          color: model.enabled ? C.darkColor2 : C.darkColor3,
        ),
        cursorColor: C.darkColor1,
        initialValue: model.initialValue,
        onChanged: model.onChanged,
        enabled: model.enabled,
        validator: model.validator,
        keyboardType: model.keyboardType,
        autocorrect: false,
        autovalidate: true,
      ),
    );
  }
}
