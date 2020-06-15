import '../base/view.dart';
import 'events.dart';
import 'events_model.dart';

abstract class EventsView extends View<Events, EventsModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
