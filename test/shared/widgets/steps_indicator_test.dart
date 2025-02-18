import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/shared/widgets/steps_indicator.dart';
import 'package:happy_day/theme/theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('StepsIndicator', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      await tester.pumpApp(
        const StepsIndicator(
          stepsCount: 3,
          currentStep: 1,
        ),
      );

      expect(find.byType(StepProgressIndicator), findsOneWidget);
    });

    testWidgets('shows correct number of steps', (tester) async {
      const stepsCount = 5;
      await tester.pumpApp(
        const StepsIndicator(
          stepsCount: stepsCount,
          currentStep: 1,
        ),
      );

      final indicator = tester.widget<StepProgressIndicator>(
        find.byType(StepProgressIndicator),
      );
      expect(indicator.totalSteps, stepsCount);
    });

    testWidgets('highlights current step correctly', (tester) async {
      const currentStep = 2;
      await tester.pumpApp(
        const StepsIndicator(
          stepsCount: 3,
          currentStep: currentStep,
        ),
      );

      final indicator = tester.widget<StepProgressIndicator>(
        find.byType(StepProgressIndicator),
      );

      // Test that step 2 is highlighted with secondary color
      final colorForCurrentStep = indicator.customColor?.call(currentStep - 1);
      expect(colorForCurrentStep, HappyDayTheme.secondaryColor);

      // Test that other steps are not highlighted
      final colorForOtherStep = indicator.customColor?.call(0);
      expect(
        colorForOtherStep,
        HappyDayTheme.secondaryColorWithTransparency,
      );
    });

    testWidgets(
      'highlights completed steps when selectCompletedSteps is true',
      (tester) async {
        const currentStep = 2;
        await tester.pumpApp(
          const StepsIndicator(
            stepsCount: 3,
            currentStep: currentStep,
            selectCompletedSteps: true,
          ),
        );

        final indicator = tester.widget<StepProgressIndicator>(
          find.byType(StepProgressIndicator),
        );

        // Test that current and previous steps are highlighted
        for (var i = 0; i < currentStep; i++) {
          final color = indicator.customColor?.call(i);
          expect(color, HappyDayTheme.secondaryColor);
        }

        // Test that future steps are not highlighted
        final colorForFutureStep = indicator.customColor?.call(currentStep);
        expect(
          colorForFutureStep,
          HappyDayTheme.secondaryColorWithTransparency,
        );
      },
    );

    testWidgets('has correct size properties', (tester) async {
      await tester.pumpApp(
        const StepsIndicator(
          stepsCount: 3,
          currentStep: 1,
        ),
      );

      final indicator = tester.widget<StepProgressIndicator>(
        find.byType(StepProgressIndicator),
      );

      expect(indicator.size, 5);
      expect(indicator.selectedSize, 2.5);
      expect(indicator.unselectedSize, 2.5);
    });
  });
}
