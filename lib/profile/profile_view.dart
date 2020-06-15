import '../base/view.dart';
import 'profile.dart';
import 'profile_model.dart';

abstract class ProfileView extends View<Profile, ProfileModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
