import 'package:bt_mobile/tamagotchi/tamagotchi_state/tamagotchi_button.dart';
import 'package:flutter/cupertino.dart';

abstract class TamagotchiState {
  Widget sprite;
  List<TamagotchiButton> buttons;

}