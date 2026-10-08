import 'package:flutter_test/flutter_test.dart';
import 'package:midad/app/app.dart';

void main() {
  testWidgets('Midad home screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MidadApp());

    expect(find.text('مداد'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    expect(find.text('مرحبًا بك في مداد'), findsOneWidget);
    expect(find.text('الرياضيات'), findsOneWidget);
  });
}
