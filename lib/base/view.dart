/// This is the base View.
///
/// We extend this class when defining our Views for our pages and screens or
/// complex and re-usable widgets. Notice how it extends State. I'll go in more
/// depth about what that really is. For now, just know that a State class
/// handles our visuals.
///
/// After you sort of get this, take a look at example/example.dart
///
/// Example:
/// abstract class MyScreenView extends View<MyScreen, MyScreenModel> {
///   @override
//    void initState() {
//      super.initState();
//      widget.presenter.view = this;
//    }
// }

import 'package:flutter/material.dart';

import 'model.dart';

abstract class View<S extends StatefulWidget, M extends Model>
    extends State<S> {
  M model;

  /// This takes a model and calls for the framework to call the build method,
  /// or in other words, re-draw itself to show any updated changes.
  void setModel(M m) {
    setState(() {
      model = m;
    });
  }
}
