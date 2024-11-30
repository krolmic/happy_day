import 'package:flutter/material.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepsIndicator extends StatelessWidget {
  const StepsIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: dotsCount,
      currentStep: position,
      selectedColor: HappyDayTheme.secondaryColor,
      unselectedColor: HappyDayTheme.secondaryColorWithTransparency,
      selectedSize: 2.5,
      unselectedSize: 2.5,
    );
  }
}
