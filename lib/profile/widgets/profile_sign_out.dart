import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class ProfileSignOut extends StatelessWidget {
  const ProfileSignOut({Key key, @required this.onSignOutPressed})
      : super(key: key);

  final Function onSignOutPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(4.0),
            backgroundColor: MaterialStateProperty.all<Color>(C.darkColor1),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.0)))),
        child: AutoSizeText(
          S.profileSignOut,
          maxLines: 1,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => onSignOutPressed(context),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );
  }
}
