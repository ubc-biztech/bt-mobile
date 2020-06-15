import '../base/view.dart';
import 'main.dart';
import 'main_model.dart';

abstract class MainView extends View<Main, MainModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
