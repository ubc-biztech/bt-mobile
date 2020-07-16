import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

import '../new_member.dart';
import 'form_model.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    Key key,
    @required this.model,
    @required this.widget,
  }) : super(key: key);

  final SubmitButtonModel model;
  final NewMember widget;

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
            model.labelText,
            maxLines: 1,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => widget.presenter.onSubmitButtonPressed(context),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
