part of '../edit_structure_page.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    this.color,
    super.key,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.labelMedium?.copyWith(
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
