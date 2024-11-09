import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('Structure', () {
    testWidgets('renders correctly when not started and not completed',
        (tester) async {
      await tester.pumpScaffold(
        const Structure(
          name: 'Test Structure',
          description: 'Test Description',
          isCompleted: false,
          isStarted: false,
          completedStepsCount: 0,
          totalStepsCount: 3,
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('renders correctly when completed', (tester) async {
      await tester.pumpScaffold(
        const Structure(
          name: 'Test Structure',
          description: 'Test Description',
          isCompleted: true,
          isStarted: false,
          completedStepsCount: 3,
          totalStepsCount: 3,
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('renders progress bar when in progress', (tester) async {
      await tester.pumpScaffold(
        const Structure(
          name: 'Test Structure',
          description: 'Test Description',
          isCompleted: false,
          isStarted: true,
          completedStepsCount: 2,
          totalStepsCount: 3,
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('2 / 3'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
      expect(find.byIcon(Icons.add), findsNothing);
    });
  });
}
