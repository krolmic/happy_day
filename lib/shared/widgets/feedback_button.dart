import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      elevation: 0,
      onPressed: () => Wiredash.of(context).show(inheritMaterialTheme: true),
      child: const Icon(
        Icons.feedback_outlined,
      ),
    );
  }
}
