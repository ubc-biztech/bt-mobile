import '../base/view.dart';
import 'new_member.dart';
import 'new_member_model.dart';

abstract class NewMemberView extends View<NewMember, NewMemberModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
