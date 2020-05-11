/// This is the base Presenter.
///
/// The presenter is where all the logic goes. Here, we can make changes to the
/// model then tell the View to update our visuals. The goal of this class is to
/// consolidate all logic to a single entity.
///
/// Whenever we do stuff, we do it here so that we can write unit tests or them
/// one day. That day will never co...
///
/// After you sort of get this, take a look at view.dart
///
/// Example:
/// class MyScreenPresenter extends Presenter<MyScreenView, MyScreenModel> {
///   public void doSomethingComplex() {
///     pullFromCloudDatabase();
///     if (!model.isLoading) {
///       model.isLoading = true;
///       updateView();
///     }
///   }
///
///   Future updateOurCloudDatabase() async {
///     model.userCount = await cloudDatabase.getUserCount();
///     updateView();
///   }
/// }

import 'package:bt_mobile/base/model.dart';
import 'package:bt_mobile/base/view.dart';

class Presenter<V extends View, M extends Model> {
  V _view;
  M model;

  /// This method lets us set the View like this: view = SomeView();
  set view(V view) {
    _view = view;
    updateView();
  }

  /// This method notifies the View that it needs to re-draw itself.
  void updateView() {
    _view?.setModel(model);
  }
}
