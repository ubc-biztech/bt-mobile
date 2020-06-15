import '../base/presenter.dart';
import 'events_model.dart';
import 'events_view.dart';

class EventsPresenter extends Presenter<EventsView, EventsModel> {
  EventsPresenter() {
    model = EventsModel();
  }
}
