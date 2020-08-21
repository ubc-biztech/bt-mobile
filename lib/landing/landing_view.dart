import '../base/view.dart';
import 'landing.dart';
import 'landing_model.dart';

abstract class LandingView extends View<Landing, LandingModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
