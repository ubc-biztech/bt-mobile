import 'package:bt_mobile/tamagotchi/tamagotchi_model.dart';
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


}
