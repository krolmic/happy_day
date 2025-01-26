part of '../daily_structures_page.dart';

class DailyStructure extends StatelessWidget {
  const DailyStructure({
    required this.structure,
    required this.date,
    this.structureOfADay,
    this.isDisabled = false,
    this.isEditableOnly = false,
    super.key,
  });

  final Structure structure;
  final StructureOfADay? structureOfADay;
  final bool isDisabled;
  final bool isEditableOnly;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final isStarted = structureOfADay != null;
    final completedStepsCount = structureOfADay?.completedStepsIds.length ?? 0;
    final totalStepsCount =
        structureOfADay?.stepsIds.length ?? structure.stepsIds.length;
    // If new steps were added to the structure and the structure was started
    // previously, daily completed steps may be greater than total steps count.
    final completedStepsCountToBuild = completedStepsCount > totalStepsCount
        ? totalStepsCount
        : completedStepsCount;

    final buildCheckIconButton =
        isStarted && completedStepsCountToBuild == totalStepsCount;
    final buildAddIconButton = !isStarted && !buildCheckIconButton;
    final buildIconButton = buildCheckIconButton || buildAddIconButton;

    final color = isEditableOnly
        ? structure.color.withValues(alpha: 0.5)
        : structure.color;

    return ListTile(
      tileColor: color.withValues(alpha: 0.25),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      onTap: () {
        if (isDisabled) return;

        if (isEditableOnly) {
          context.pushNamed(
            RoutesNames.editStructure,
            extra: structure,
          );
        } else {
          context.pushNamed(
            RoutesNames.structureDetails,
            extra: StructureDetailsRouteParameters(
              structure: structure,
              date: date,
              structureOfADay: structureOfADay,
            ),
          );
        }
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
          fontWeight: FontWeight.w500,
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
                isEditableOnly: isEditableOnly,
                date: date,
                color: color,
              )
            : _StructureProgress(
                completedStepsCount: completedStepsCountToBuild,
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
    required this.color,
    this.structureOfADay,
    this.isDisabled = false,
    this.isEditableOnly = false,
  });

  final bool isCompleted;
  final bool isEditableOnly;
  final Structure structure;
  final StructureOfADay? structureOfADay;
  final bool isDisabled;
  final DateTime date;
  final Color color;

  IconData getIconData() {
    if (isEditableOnly) {
      return Icons.edit_outlined;
    }

    return isCompleted ? Icons.check : Icons.add;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: color,
      ),
      onPressed: () {
        if (isDisabled) return;

        if (isEditableOnly) {
          context.pushNamed(
            RoutesNames.editStructure,
            extra: structure,
          );
        } else if (isCompleted) {
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
        getIconData(),
        size: 20,
      ),
    );
  }
}

class _StructureProgress extends StatefulWidget {
  const _StructureProgress({
    required this.completedStepsCount,
    required this.totalStepsCount,
    required this.color,
  });

  final int completedStepsCount;
  final int totalStepsCount;
  final Color color;

  @override
  State<_StructureProgress> createState() => _StructureProgressState();
}

class _StructureProgressState extends State<_StructureProgress> {
  late final ValueNotifier<double> _progressNotifier;

  @override
  void initState() {
    super.initState();
    _progressNotifier = ValueNotifier(widget.completedStepsCount.toDouble());
  }

  @override
  void didUpdateWidget(_StructureProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.completedStepsCount != widget.completedStepsCount) {
      _progressNotifier.value = widget.completedStepsCount.toDouble();
    }
  }

  @override
  void dispose() {
    _progressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(1),
      child: SimpleCircularProgressBar(
        backColor: theme.colorScheme.surface,
        progressColors: [widget.color.withValues(alpha: 0.75)],
        animationDuration: 1,
        valueNotifier: _progressNotifier,
        maxValue: widget.totalStepsCount.toDouble(),
        backStrokeWidth: 4,
        progressStrokeWidth: 4,
        fullProgressColor: widget.color.withValues(alpha: 0.75),
        size: 50,
        mergeMode: true,
        onGetText: (double value) {
          return Text(
            '${widget.completedStepsCount} / ${widget.totalStepsCount}',
            style: TextStyle(
              fontSize: 10,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}
