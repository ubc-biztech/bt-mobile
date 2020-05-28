/// These Presenter classes can be jam-packed with action. The onButtonPressed
/// method lives here and is accessible by the View. You can see how it takes
/// data from the model, manipulates it, and tells the View to update itself.
///
/// Simple stuff.
///
/// Hopefully, you now have a basic idea of MVP and how we'll be building out
/// this awesome app. There will be more guides to come when the cooler
/// things are implemented!

import '../presenter.dart';
import 'example_model.dart';
import 'example_view.dart';

class ExamplePresenter extends Presenter<ExampleView, ExampleModel> {
  void onButtonPressed() {
    model.exampleNumber *= 99; // Multiply itself by 99
    updateView(); // Tell View to show the updated number
    _anAsynchronousTask(); // But wait, there's more! Hold on a sec...
  }

  /// Asynchronous tasks must have a return type of Future, but it doesn't
  /// necessarily have to return anything thanks to the lint rules we're using.
  /// Futures are equivalent to JavaScript's Promise.
  Future _anAsynchronousTask() async {
    await Future.delayed(const Duration(seconds: 1)); // Literally hold on a sec
    model.exampleNumber /= 99; // Divide itself by 99
    updateView(); // Tell View to update
  }
}
