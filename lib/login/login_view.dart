import '../base/view.dart';
import 'login.dart';
import 'login_model.dart';

abstract class LoginView extends View<Login, LoginModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
