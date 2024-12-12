import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/structure_details/view/structure_details_page.dart';
import 'package:structures_api/structures_api.dart';

import '../../../helpers/pump_scaffold.dart';

void main() {
  group('Header', () {
    late Structure structure;

    setUp(() {
      structure = Structure(
        id: '1',
        title: 'Test Structure',
        description: 'Test Description',
        colorRed: 255,
        colorGreen: 0,
        colorBlue: 0,
      );
    });

    testWidgets('renders title correctly', (tester) async {
      await tester.pumpScaffold(
        Header(structure: structure),
      );

      expect(find.text('Test Structure'), findsOneWidget);
    });

    testWidgets('renders description when present', (tester) async {
      await tester.pumpScaffold(
        Header(structure: structure),
      );

      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('does not render description when absent', (tester) async {
      structure = structure.copyWith(description: null);

      await tester.pumpScaffold(
        Header(structure: structure),
      );

      expect(find.text('Test Description'), findsNothing);
    });

    testWidgets('applies correct color from structure', (tester) async {
      final color = Color.fromARGB(
        255,
        structure.colorRed,
        structure.colorGreen,
        structure.colorBlue,
      );

      await tester.pumpScaffold(
        Header(structure: structure),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final boxDecoration = container.decoration! as BoxDecoration;

      expect(
        boxDecoration.color?.r,
        equals(color.withValues(alpha: 0.25).r),
      );

      final titleText = tester.widget<Text>(
        find.text('Test Structure'),
      );

      expect(
        (titleText.style?.color ?? Colors.black).r,
        equals(color.r),
      );
    });
  });
}
