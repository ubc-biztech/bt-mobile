import 'package:bt_mobile/common/term_manager.dart';
import 'package:bt_mobile/home/home.dart';
import 'package:bt_mobile/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'splash_model.dart';
import 'splash_view.dart';

class SplashPresenter extends Presenter<SplashView, SplashModel> {
  SplashPresenter() {
    model = SplashModel();
  }

  final GetIt _getIt = GetIt.instance;

  Future setupManagers(BuildContext context) async {
    _getIt.registerSingleton<TermManager>(TermManager());
    await _getIt<TermManager>().setupTermManager();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(HomePresenter())));
  }
}
