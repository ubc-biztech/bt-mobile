import 'package:flutter/material.dart';

abstract class TamagotchiBaseState {
  Widget sprite;
  List<TamagotchiButton> buttons;
}

abstract class TamagotchiButton {
  Widget icon;

  Future onPressed();
}

class TamagotchiSleepingButton extends TamagotchiButton {
  TamagotchiSleepingButton() {
    // icon = someIcon();
  }

  @override
  Future onPressed() {
    //
  }
}

class TamagotchiStudyingButton extends TamagotchiButton {
  @override
  Future onPressed() {
    //
  }
}

class TamagotchiEatingButton extends TamagotchiButton {
  @override
  Future onPressed() {
    //
  }
}

class TamagotchiDefaultState extends TamagotchiBaseState {
  TamagotchiDefaultState() {
    sprite = Container();
    buttons = [
      TamagotchiStudyingButton(),
      TamagotchiEatingButton(),
      TamagotchiSleepingButton(),
    ];
  }
}
