import '../base/view.dart';
import 'home.dart';
import 'home_model.dart';

abstract class HomeView extends View<Home, HomeModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
