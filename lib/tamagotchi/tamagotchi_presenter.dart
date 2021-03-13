import 'package:bt_mobile/tamagotchi/tamagotchi_model.dart';
import 'package:bt_mobile/tamagotchi/tamagotchi_view.dart';
import 'package:flutter/material.dart';

import '../base/presenter.dart';
import 'state/tamagotchi_base_state.dart';

class TamagotchiPresenter extends Presenter<TamagotchiView, TamagotchiModel> {
  TamagotchiPresenter() {
    model = TamagotchiModel();
  }

  bool _isInitialized = false;
  TamagotchiBaseState state;

  void setTamagotchiState(TamagotchiBaseState state) {
    this.state = state;
    updateButtons();
  }

  void updateButtons() {
    model.buttons = state.buttons
        .map((button) => RaisedButton(
              child: button.icon,
              onPressed: button.onPressed,
            ))
        .toList();
  }

  void onInitState() {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
  }
}
