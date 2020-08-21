import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileSignOut extends StatelessWidget {
  const ProfileSignOut({Key key, @required this.onSignOutPressed})
      : super(key: key);

  final Function onSignOutPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: C.darkBackgroundCard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 26.0),
          child: RaisedButton(
            color: C.darkColor1,
            child: Container(
              height: 50.0,
              constraints: const BoxConstraints(minWidth: double.infinity),
              alignment: Alignment.center,
              child: AutoSizeText(
                'Sign out',
                maxLines: 1,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () => onSignOutPressed(context),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 4,
      ),
    );
  }
}
