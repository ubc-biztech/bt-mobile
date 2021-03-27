import 'package:bt_mobile/tamagotchi/tamagotchi_presenter.dart';
import 'package:bt_mobile/tamagotchi/tamagotchi_state/tamagotchi_button.dart';

class EatingButton extends TamagotchiButton {
  TamagotchiPresenter presenter;

  @override
  void onPressed() {
    presenter.switchToEatingState();
  }

}