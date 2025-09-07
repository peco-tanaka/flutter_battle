// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_settings/app.dart';
import 'package:flutter_settings/flavors.dart';

void main() {
  testWidgets('App displays hello message', (WidgetTester tester) async {
    // Initialize flavor for testing
    F.appFlavor = Flavor.develop;
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our app displays the correct title and message.
    expect(find.text('Flutter Settings Dev'), findsOneWidget);
    expect(find.text('Hello Flutter Settings Dev'), findsOneWidget);
  });
}
