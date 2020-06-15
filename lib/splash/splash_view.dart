import 'package:flutter/material.dart';

import '../base/view.dart';
import 'splash.dart';
import 'splash_model.dart';

abstract class SplashView extends View<Splash, SplashModel>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    widget.presenter.initializeAnimation(this);
    widget.presenter.setupManagers(context);
  }

  @override
  void dispose() {
    widget.presenter.onDispose();
    super.dispose();
  }
}
