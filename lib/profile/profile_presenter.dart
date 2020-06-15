import '../base/presenter.dart';
import 'profile_model.dart';
import 'profile_view.dart';

class ProfilePresenter extends Presenter<ProfileView, ProfileModel> {
  ProfilePresenter() {
    model = ProfileModel();
  }
}
