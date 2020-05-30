import 'package:intl/intl.dart';

import '../base/presenter.dart';
import 'home_model.dart';
import 'home_view.dart';

class HomePresenter extends Presenter<HomeView, HomeModel> {
  HomePresenter() {
    model = HomeModel();
    final DateFormat format = DateFormat('MMMEd');
    model.date = DateFormat('yMMMEd').format(today);
    model.startDate = format.format(termStart);
    model.endDate = format.format(termEnd);
    calculatePercentage();
  }

  void calculatePercentage() {
    model.percentage =
        (today.millisecondsSinceEpoch - termStart.millisecondsSinceEpoch) /
            (termEnd.millisecondsSinceEpoch - termStart.millisecondsSinceEpoch);
    if (model.percentage > 1.0) {
      model.percentage = 1.0;
    } else if (model.percentage < 0.0) {
      model.percentage = 0.0;
    }
  }

  void setProgressWidth(double width) {
    model.topProgressWidth = model.percentage * width;
    updateView();
  }

  DateTime today = DateTime(2020, 10, 28); // DateTime.now();
  DateTime termStart = DateTime(2020, 9, 8);
  DateTime termEnd = DateTime(2020, 12, 3);
}
