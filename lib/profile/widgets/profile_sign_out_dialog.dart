import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class ProfileSignOutDialog extends StatelessWidget {
  const ProfileSignOutDialog({Key key, @required this.onConfirmedPressed})
      : super(key: key);

  final Function onConfirmedPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 12.0),
              const AutoSizeText(
                S.confirmSignOutTitle,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: C.darkColor1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              AutoSizeText(
                S.confirmSignOutDescription,
                style: TextStyle(fontSize: 16.0, color: C.darkColor2),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4.0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(C.darkColor1),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(45.0)))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: AutoSizeText(
                        S.confirmSignOutButton,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    onPressed: () => onConfirmedPressed(context),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4.0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(C.darkColor1),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(45.0)))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: AutoSizeText(
                        S.confirmSignOutCancelButton,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: C.darkBackgroundCard,
      ),
    );
  }
}
