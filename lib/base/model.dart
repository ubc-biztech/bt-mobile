///  ____ _____  _    ____ _____   _   _ _____ ____  _____
/// / ___|_   _|/ \  |  _ \_   _| | | | | ____|  _ \| ____|
/// \___ \ | | / _ \ | |_) || |   | |_| |  _| | |_) |  _|
///  ___) || |/ ___ \|  _ < | |   |  _  | |___|  _ <| |___
/// |____/ |_/_/   \_\_| \_\|_|   |_| |_|_____|_| \_\_____|
///
/// We will be using the Model-View-Presenter (MVP) architecture pattern for the
/// CLEANEST codebase ever (knock on wood). This guide will take you through
/// each base class and an example implementation to give you a better
/// understanding of how the M, V, and P work cohesively.
///
/// There is a number on the screen and the user presses a button that
/// increments it, this is what happens behind the scenes:
///   1. The View's Button tells the Presenter that the button has been pressed.
///   2. The Presenter increments the number that is contained in the Model.
///   3. The Presenter tells the View that the number in the Model has changed.
///   4. The View re-draws itself and shows the incremented number.
///
/// Visually, it looks like this:
///   View <--> Presenter <--> Model
///
/// Maybe that's confusing, so here's an in-depth explanation with code:
///
/// This is the base Model.
///
/// We use this class to store data that the View can
/// use in order to show the right information. Data that goes here includes
/// numbers, list of names (strings), booleans that let the View know to show or
/// hide something, etc. It doesn't have to be primitive data, but the
/// lighter this class is, the better.
///
/// After you sort of get this, take a look at presenter.dart
///
/// Example:
/// class MyScreenModel extends Model {
///   bool isLoading = false;
///   int userCount = 0;
/// }

class Model {}
