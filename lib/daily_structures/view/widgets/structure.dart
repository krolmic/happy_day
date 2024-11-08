part of '../daily_structures_page.dart';

class Structure extends StatelessWidget {
  const Structure({
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.isStarted,
    required this.completedStepsCount,
    required this.totalStepsCount,
    super.key,
  });

  final String name;
  final String description;
  final bool isStarted;
  final int completedStepsCount;
  final int totalStepsCount;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final buildAddIconButton = !isStarted && !isCompleted;
    final buildCheckIconButton =
        isCompleted || completedStepsCount == totalStepsCount;
    final buildIconButton = buildCheckIconButton || buildAddIconButton;

    return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(name),
        subtitle: Text(description),
        trailing: SizedBox(
          width: 50,
          height: 50,
          child: buildIconButton
              ? _StructureIconButton(isCompleted: isCompleted)
              : _StructureProgress(
                  completedStepsCount: completedStepsCount,
                  totalStepsCount: totalStepsCount,
                ),
        ));
  }
}

class _StructureIconButton extends StatelessWidget {
  const _StructureIconButton({
    required this.isCompleted,
  });

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.primary,
      ),
      onPressed: () {},
      icon: Icon(
        isCompleted ? Icons.check : Icons.add,
        size: 20,
      ),
    );
  }
}

class _StructureProgress extends StatelessWidget {
  const _StructureProgress({
    required this.completedStepsCount,
    required this.totalStepsCount,
  });

  final int completedStepsCount;
  final int totalStepsCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleCircularProgressBar(
      backColor: theme.colorScheme.surface,
      progressColors: [theme.colorScheme.primary.withOpacity(0.75)],
      animationDuration: 1,
      valueNotifier: ValueNotifier(completedStepsCount.toDouble()),
      maxValue: totalStepsCount.toDouble(),
      backStrokeWidth: 4,
      progressStrokeWidth: 4,
      fullProgressColor: theme.colorScheme.primary.withOpacity(0.75),
      size: 50,
      mergeMode: true,
      onGetText: (double value) {
        return Text(
          '$completedStepsCount / $totalStepsCount',
          style: TextStyle(
            fontSize: 10,
            color: theme.colorScheme.primary,
          ),
        );
      },
    );
  }
}
