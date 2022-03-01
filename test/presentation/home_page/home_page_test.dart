import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/presentation/home_page/home_page.dart';

void main() {
  group("HomePage", () {
    testWidgets("Renders HomePage", (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
