import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:bt_mobile/common/term_manager.dart';
import 'package:bt_mobile/common/weather_manager.dart';
import 'package:bt_mobile/login/login.dart';
import 'package:bt_mobile/login/login_presenter.dart';
import 'package:bt_mobile/main/main.dart';
import 'package:bt_mobile/main/main_presenter.dart';
import 'package:bt_mobile/new_member/new_member.dart';
import 'package:bt_mobile/new_member/new_member_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'splash_model.dart';
import 'splash_view.dart';

class SplashPresenter extends Presenter<SplashView, SplashModel> {
  SplashPresenter() {
    model = SplashModel();
  }

  final GetIt _getIt = GetIt.I;
  AnimationController controller;
  Animation<double> animation;

  void initializeAnimation(TickerProvider ticker) {
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: ticker);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Future setupManagers(BuildContext context) async {
    await DotEnv().load('.env');
    _getIt.registerSingleton<TermManager>(TermManager());
    _getIt.registerSingleton<WeatherManager>(WeatherManager());
    _getIt.registerSingleton<AuthenticationManager>(AuthenticationManager());

    AuthenticationStatus status;
    // work on these asynchronously
    List<Future> waitForThese = [
      _getIt<TermManager>().setupTermManager(),
      _getIt<WeatherManager>().setupWeatherManager(),
      _getIt<AuthenticationManager>()
          .setupAuthManager()
          .then((s) => status = s),
    ];
    await Future.wait(waitForThese);

    Widget page = _getPageRoute(status);
    await Future.delayed(const Duration(seconds: 1));
    await controller.reverse();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  Widget _getPageRoute(AuthenticationStatus status) {
    switch (status) {
      case AuthenticationStatus.registered:
        return Main(MainPresenter());
      case AuthenticationStatus.unregistered:
        return NewMember(NewMemberPresenter());
      case AuthenticationStatus.unauthenticated:
    }
    return Login(LoginPresenter());
  }

  void onDispose() {
    controller.dispose();
  }
}
