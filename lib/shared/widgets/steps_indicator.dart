import 'package:flutter/material.dart';
import 'package:happy_day/edit_structure/edit_structure.dart';
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
    final colors = context.structureWizardColors;

    return StepProgressIndicator(
      totalSteps: stepsCount,
      currentStep: currentStep,
      customColor: (index) => selectCompletedSteps
          ? index + 1 <= currentStep
              ? colors.enabledControllsColor
              : colors.disabledControllsColor
          : index + 1 == currentStep
              ? colors.enabledControllsColor
              : colors.disabledControllsColor,
      size: 5,
      selectedSize: 2.5,
      unselectedSize: 2.5,
    );
  }
}
