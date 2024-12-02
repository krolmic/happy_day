import 'package:flutter/material.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepsIndicator extends StatelessWidget {
  const StepsIndicator({
    required this.stepsCount,
    required this.currentStep,
    this.selectCompletedSteps = false,
    super.key,
  });

  final int stepsCount;
  final int currentStep;
  final bool selectCompletedSteps;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: stepsCount,
      currentStep: currentStep,
      customColor: (index) => selectCompletedSteps
          ? index + 1 <= currentStep
              ? HappyDayTheme.secondaryColor
              : HappyDayTheme.secondaryColorWithTransparency
          : index + 1 == currentStep
              ? HappyDayTheme.secondaryColor
              : HappyDayTheme.secondaryColorWithTransparency,
      size: 5,
      selectedSize: 2.5,
      unselectedSize: 2.5,
    );
  }
}
