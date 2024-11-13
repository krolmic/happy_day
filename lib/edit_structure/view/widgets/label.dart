part of '../edit_structure_page.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    this.isActive = false,
    super.key,
  });

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isActive ? theme.primaryColor : theme.unselectedWidgetColor;

    return Text(
      text,
      style: theme.textTheme.labelMedium?.copyWith(
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
