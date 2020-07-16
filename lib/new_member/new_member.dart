import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/new_member/form/custom_radio_field.dart';
import 'package:bt_mobile/new_member/form/form_model.dart';
import 'package:flutter/material.dart';

import 'form/custom_submit_button.dart';
import 'form/custom_text_field.dart';
import 'new_member_presenter.dart';
import 'new_member_view.dart';
import 'widgets/new_member_greeting.dart';

class NewMember extends StatefulWidget {
  const NewMember(this.presenter, {Key key}) : super(key: key);

  final NewMemberPresenter presenter;

  @override
  _NewMemberState createState() => _NewMemberState();
}

class _NewMemberState extends NewMemberView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const NewMemberGreeting(),
              Container(
                constraints: const BoxConstraints(minWidth: double.infinity),
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Card(
                  color: C.darkBackgroundCard,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23.0, vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: model.formModels.map((model) {
                        if (model is DisclaimerModel) {
                          return AutoSizeText(
                            model.labelText,
                            maxLines: 1,
                            style: TextStyle(
                              color: C.darkError,
                            ),
                          );
                        } else if (model is TextFieldModel) {
                          return CustomTextField(
                            model: model,
                          );
                        } else if (model is RadioFieldModel) {
                          return CustomRadioField(
                            model: model,
                          );
                        } else if (model is SubmitButtonModel) {
                          return CustomSubmitButton(
                              model: model, widget: widget);
                        }
                        return Container();
                      }).toList(),
                    ),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  elevation: 4,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
