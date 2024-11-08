import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/app/app.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(DailyStructuresPage), findsOneWidget);
    });
  });
}
