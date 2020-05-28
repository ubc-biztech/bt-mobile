import '../view.dart';
/// This is a lot of text.
///
/// TL;DR: Yes this is an abstract class, any logic that HAS to be done by the
///        View will happen here, just like the overridden initState method.
///
/// Notice how this is an abstract class that is extended by _ExampleState in
/// the example.dart file. The reason why we have this 'middle man' between
/// _ExampleState and View is to alleviate as much as we can from the State
/// class. Because we're using a structured MVP design pattern, we shouldn't add
/// any logic to the State class since it goes in the Presenter class, or maybe
/// even here.
///
/// An example of some necessary logic that goes here is this overridden
/// initState method. We HAVE to pass a reference of this class to the
/// Presenter so that it knows which View to update when updateView is called.
/// Due to the constraints of OOP, this method can't live in the base View
/// class, so it goes here.
///
/// Lastly, check out example_presenter.dart.

import 'example.dart';
import 'example_model.dart';

abstract class ExampleView extends View<Example, ExampleModel> {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
