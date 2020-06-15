import '../base/view.dart';
import 'splash.dart';
import 'splash_model.dart';

abstract class SplashView extends View<Splash, SplashModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
