import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:structures_api/structures_api.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('Structure', () {
    final date = DateTime.now();
    testWidgets('renders correctly when not started and not completed',
        (tester) async {
      await tester.pumpScaffold(
        DailyStructure(
          date: date,
          structure: Structure(
            id: '1',
            title: 'Test Structure',
            description: 'Test Description',
          ),
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('renders correctly when completed', (tester) async {
      await tester.pumpScaffold(
        DailyStructure(
          date: date,
          structure: Structure(
            id: '1',
            title: 'Test Structure',
            description: 'Test Description',
            stepsIds: ['1', '2'],
          ),
          structureOfADay: StructureOfADay(
            completedStepsIds: ['1', '2'],
            stepsIds: ['1', '2'],
            date: date,
            id: '1',
            structureId: '1',
          ),
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('renders progress bar when in progress', (tester) async {
      await tester.pumpScaffold(
        DailyStructure(
          date: date,
          structure: Structure(
            id: '1',
            title: 'Test Structure',
            description: 'Test Description',
            stepsIds: ['1', '2'],
          ),
          structureOfADay: StructureOfADay(
            completedStepsIds: ['1'],
            stepsIds: ['1', '2'],
            date: date,
            id: '1',
            structureId: '1',
          ),
        ),
      );

      expect(find.text('Test Structure'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('1 / 2'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
      expect(find.byIcon(Icons.add), findsNothing);
    });
  });
}
