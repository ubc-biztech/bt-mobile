import 'package:bt_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/testing/async.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.resetEpoch();
  });

  testWidgets('Build app and warm up frame back to back',
      (WidgetTester tester) async {
    final FakeAsync fakeAsync = FakeAsync();
    fakeAsync.run((self) async {
      runApp(BizTechMobile());
      expect(WidgetsBinding.instance.renderViewElement, isNull);
      fakeAsync.flushTimers();
      expect(WidgetsBinding.instance.renderViewElement, isNotNull);
    });
  });
}
