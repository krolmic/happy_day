import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/shared/widgets/max_width.dart';

import '../../helpers/pump_scaffold.dart';

void main() {
  group('MaxWidth', () {
    testWidgets('renders child with max width constraint', (tester) async {
      const childKey = Key('child_key');
      const child = Text('Test', key: childKey);

      await tester.pumpScaffold(
        const MaxWidth(
          child: child,
        ),
      );

      expect(find.byKey(childKey), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(MaxWidth),
          matching: find.byType(Container),
        ),
      );

      expect(
        container.constraints?.maxWidth,
        equals(MaxWidth.defaultMaxWidth),
      );
    });
  });
}
