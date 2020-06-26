import '../base/presenter.dart';
import 'events_model.dart';
import 'events_view.dart';

class EventsPresenter extends Presenter<EventsView, EventsModel> {
  EventsPresenter() {
    model = EventsModel();
  }

  bool _isInitialized = false;

  void onInitState() {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
    _fetchEvents();
  }

  Future _fetchEvents() async {
    // do nothing for now
  }
}
