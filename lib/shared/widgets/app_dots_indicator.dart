import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:happy_day/shared/theme.dart';

class AppDotsIndicator extends StatelessWidget {
  const AppDotsIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        activeColor: HappyDayTheme.secondaryColor,
        color: HappyDayTheme.secondaryColorWithTransparency,
        activeSize: const Size.square(8),
        size: const Size.square(8),
      ),
    );
  }
}
