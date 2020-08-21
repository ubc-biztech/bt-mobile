import '../base/view.dart';
import 'member_info.dart';
import 'member_info_model.dart';

abstract class NewMemberView extends View<NewMember, NewMemberModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
