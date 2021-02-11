import 'package:flutter/material.dart';
import 'tamagotchi_presenter.dart';
import 'tamagotchi_view.dart';

class Tamagotchi extends StatefulWidget {
  const Tamagotchi(this.presenter, {Key key}) : super(key: key);

  final TamagotchiPresenter presenter;

  @override
  _TamagotchiState createState() => _TamagotchiState();
}

class _TamagotchiState extends TamagotchiView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
