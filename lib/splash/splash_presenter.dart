import 'package:bt_mobile/common/term_manager.dart';
import 'package:bt_mobile/common/weather_manager.dart';
import 'package:bt_mobile/main/main.dart';
import 'package:bt_mobile/main/main_presenter.dart';
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
    final List<Future> waitForThese = [
      _getIt<TermManager>().setupTermManager(),
      _getIt<WeatherManager>().setupWeatherManager()
    ]; // work on these asynchronously
    await Future.wait(waitForThese);
    final Main main = Main(MainPresenter());
    await Future.delayed(const Duration(seconds: 1));
    await controller.reverse();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => main));
  }

  void onDispose() {
    controller.dispose();
  }
}
