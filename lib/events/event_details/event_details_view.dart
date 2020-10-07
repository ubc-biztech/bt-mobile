import 'package:bt_mobile/base/view.dart';

import 'event_details.dart';
import 'event_details_model.dart';

abstract class EventDetailsView extends View<EventDetails, EventDetailsModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
