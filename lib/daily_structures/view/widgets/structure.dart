part of '../daily_structures_page.dart';

class Structure extends StatelessWidget {
  const Structure({
    required this.name,
    required this.description,
    required this.isCompleted,
    super.key,
  });

  final String name;
  final String description;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      trailing: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.primary,
        ),
        onPressed: () {},
        icon: Icon(isCompleted ? Icons.check : Icons.add),
      ),
    );
  }
}
