import 'package:bt_mobile/tamagotchi/tamagotchi_model.dart';
import 'package:bt_mobile/tamagotchi/tamagotchi_state/tamagotchi_button.dart';
import 'package:bt_mobile/tamagotchi/tamagotchi_view.dart';

import '../base/presenter.dart';

class TamagotchiPresenter extends Presenter<TamagotchiView, TamagotchiModel> {
  TamagotchiPresenter() {
    model = TamagotchiModel();
  }

  bool _isInitialized = false;

  void onInitState() {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
  }

  void switchToStudyingState() {
    // TODO: implement this funtion
  }

  void switchToEatingState() {
    // TODO: implement this funtion
  }

  void switchToSleepingState() {
    // TODO: implement this funtion
  }

  void switchToIdleState() {
    // TODO: implement this funtion
  }

}
