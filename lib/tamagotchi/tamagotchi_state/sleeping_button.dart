import 'package:bt_mobile/tamagotchi/tamagotchi_state/tamagotchi_button.dart';

import '../tamagotchi_presenter.dart';

class SleepingButton extends TamagotchiButton {
  TamagotchiPresenter presenter;

  @override
  void onPressed() {
    presenter.switchToSleepingState();
  }

}