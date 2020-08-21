import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/landing/landing.dart';
import 'package:bt_mobile/landing/landing_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FourOhFourDialog extends StatelessWidget {
  const FourOhFourDialog({
    Key key,
  }) : super(key: key);

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
                S.newMember404ErrorTitle,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: C.darkColor1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              AutoSizeText(
                S.newMember404Error,
                style: TextStyle(fontSize: 16.0, color: C.darkColor2),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: AutoSizeText(
                        S.newMember404Button,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Landing(LandingPresenter())));
                    },
                    color: C.darkColor1,
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

class FourOhNineDialog extends StatelessWidget {
  const FourOhNineDialog({
    Key key,
  }) : super(key: key);

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
                S.newMember409ErrorTitle,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: C.darkColor1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              AutoSizeText(
                S.newMember409Error,
                style: TextStyle(fontSize: 16.0, color: C.darkColor2),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: AutoSizeText(
                        S.newMember409Button,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: C.darkColor1,
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

class GeneralErrorDialog extends StatelessWidget {
  const GeneralErrorDialog({
    Key key,
  }) : super(key: key);

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
                S.newMemberErrorTitle,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: C.darkColor1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              AutoSizeText(
                S.newMemberError,
                style: TextStyle(fontSize: 16.0, color: C.darkColor2),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: AutoSizeText(
                        S.newMemberButton,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: C.darkColor1,
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
