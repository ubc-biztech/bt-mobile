import 'package:bt_mobile/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Build app and trigger a frame', (WidgetTester tester) async {
    await tester.pumpWidget(BizTechMobile());
  });
}
