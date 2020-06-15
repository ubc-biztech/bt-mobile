import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'splash_presenter.dart';
import 'splash_view.dart';

class Splash extends StatefulWidget {
  const Splash(this.presenter, {Key key}) : super(key: key);

  final SplashPresenter presenter;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends SplashView {
  @override
  void initState() {
    super.initState();
    widget.presenter.setupManagers(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.morningBackground,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 20,
            width: 20,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
