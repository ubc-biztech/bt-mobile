import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

import 'form_model.dart';

class CustomRadioField extends StatelessWidget {
  const CustomRadioField({
    Key key,
    @required this.model,
  }) : super(key: key);

  final RadioFieldModel model;

  Widget rightSideWidget(MapEntry<int, String> keyValue) {
    if (keyValue.key == model.otherIndex) {
      return TextFormField(
        initialValue: keyValue.value,
        onChanged: model.onOtherChanged,
        style: const TextStyle(color: C.darkColor2),
      );
    }
    return AutoSizeText(
      keyValue.value,
      style: const TextStyle(
        fontSize: 16.0,
        color: C.darkColor2,
      ),
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 18.0),
        AutoSizeText(
          model.labelText,
          style: const TextStyle(
            fontSize: 16.0,
            color: C.darkColor3,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: model.values
              .map(
                (mapEntry) => Container(
                  height: mapEntry.key == model.otherIndex ? 50 : 42,
                  child: RadioListTile(
                    groupValue: model.radioValue,
                    title: rightSideWidget(mapEntry),
                    dense: false,
                    value: mapEntry.key,
                    onChanged: model.onChanged,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 2.0),
      ],
    );
  }
}
