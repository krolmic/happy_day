import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/shared/widgets/loading_indicator.dart';

import '../../helpers/pump_scaffold.dart';

void main() {
  group('LoadingIndicator', () {
    testWidgets('renders circular progress indicator', (tester) async {
      await tester.pumpScaffold(
        const LoadingIndicator(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
