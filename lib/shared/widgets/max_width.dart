import 'package:flutter/material.dart';

class MaxWidth extends StatelessWidget {
  const MaxWidth({
    required this.child,
    this.maxWidth = defaultMaxWidth,
    super.key,
  });

  static const double defaultMaxWidth = 600;

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: child,
    );
  }
}
