part of '../daily_structures_page.dart';

class DailyStructure extends StatelessWidget {
  const DailyStructure({
    required this.structure,
    required this.date,
    this.structureOfADay,
    this.isDisabled = false,
    super.key,
  });

  final Structure structure;
  final StructureOfADay? structureOfADay;
  final bool isDisabled;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final isStarted = structureOfADay != null;
    final completedStepsCount = structureOfADay?.completedStepsIds.length ?? 0;
    final totalStepsCount = structure.stepsIds.length;

    final buildCheckIconButton =
        isStarted && completedStepsCount == totalStepsCount;
    final buildAddIconButton = !isStarted && !buildCheckIconButton;
    final buildIconButton = buildCheckIconButton || buildAddIconButton;

    final color = Color(structure.color);

    return ListTile(
      tileColor: color.withOpacity(0.25),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      onTap: () {
        if (isDisabled) return;

        context.pushNamed(
          RoutesNames.structureDetails,
          extra: StructureDetailsRouteParameters(
            structure: structure,
            date: date,
            structureOfADay: structureOfADay,
          ),
        );
      },
      title: Text(
        structure.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        structure.hasDescription ? structure.description! : '-',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SizedBox(
        width: 50,
        height: 50,
        child: buildIconButton
            ? _StructureIconButton(
                isCompleted: buildCheckIconButton,
                structure: structure,
                structureOfADay: structureOfADay,
                isDisabled: isDisabled,
                date: date,
              )
            : _StructureProgress(
                completedStepsCount: completedStepsCount,
                totalStepsCount: totalStepsCount,
                color: color,
              ),
      ),
    );
  }
}

class _StructureIconButton extends StatelessWidget {
  const _StructureIconButton({
    required this.isCompleted,
    required this.structure,
    required this.date,
    this.structureOfADay,
    this.isDisabled = false,
  });

  final bool isCompleted;
  final Structure structure;
  final StructureOfADay? structureOfADay;
  final bool isDisabled;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: Color(structure.color),
      ),
      onPressed: () {
        if (isDisabled) return;

        if (isCompleted) {
          context.pushNamed(
            RoutesNames.structureDetails,
            extra: StructureDetailsRouteParameters(
              structure: structure,
              date: date,
              structureOfADay: structureOfADay,
            ),
          );
        } else {
          context.read<DailyStructuresCubit>().startStructure(structure);
        }
      },
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
    required this.color,
  });

  final int completedStepsCount;
  final int totalStepsCount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleCircularProgressBar(
      backColor: theme.colorScheme.surface,
      progressColors: [color.withOpacity(0.75)],
      animationDuration: 1,
      valueNotifier: ValueNotifier(completedStepsCount.toDouble()),
      maxValue: totalStepsCount.toDouble(),
      backStrokeWidth: 4,
      progressStrokeWidth: 4,
      fullProgressColor: color.withOpacity(0.75),
      size: 50,
      mergeMode: true,
      onGetText: (double value) {
        return Text(
          '$completedStepsCount / $totalStepsCount',
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        );
      },
    );
  }
}
