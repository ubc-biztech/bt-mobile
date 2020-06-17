import '../base/presenter.dart';
import 'login_model.dart';
import 'login_view.dart';

class LoginPresenter extends Presenter<LoginView, LoginModel> {
  LoginPresenter() {
    model = LoginModel();
  }
}
