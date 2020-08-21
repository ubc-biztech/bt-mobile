import 'package:bt_mobile/base/model.dart';
import 'package:bt_mobile/profile/widgets/profile_details/profile_details_model.dart';

class ProfileModel extends Model {
  String firstName;
  String lastName;

  List<ProfileDetailsModel> detailsModels = [];
}
