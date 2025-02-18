import 'package:flutter/material.dart';
import 'package:happy_day/theme/theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.width = 20,
    this.height = 20,
    this.strokeWidth = 2.5,
  });

  factory LoadingIndicator.tiny() {
    return const LoadingIndicator(
      width: 18,
      height: 18,
      strokeWidth: 1.5,
    );
  }
  factory LoadingIndicator.small() {
    return const LoadingIndicator();
  }

  final double width;
  final double height;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: HappyDayTheme.secondaryColor,
        ),
      );
}
