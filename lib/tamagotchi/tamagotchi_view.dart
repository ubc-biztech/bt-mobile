import '../base/view.dart';
import 'tamagotchi.dart';
import 'tamagotchi_model.dart';

abstract class TamagotchiView extends View<Tamagotchi, TamagotchiModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    widget.presenter.onInitState();
  }
}
