part of '../daily_structures_page.dart';

class DailyStructure extends StatelessWidget {
  const DailyStructure({
    required this.structure,
    required this.date,
    required this.isStarted,
    this.structureOfADay,
    this.isDisabled = false,
    this.isEditableOnly = false,
    super.key,
  });

  final Structure structure;
  final StructureOfADay? structureOfADay;
  final DateTime date;
  final bool isStarted;
  final bool isDisabled;
  final bool isEditableOnly;

  Color get color =>
      isEditableOnly ? structure.color.withValues(alpha: 0.5) : structure.color;

  int get _completedStepsCount => structureOfADay?.completedStepsCount ?? 0;

  int get _completedStepsCountToBuild =>
      _completedStepsCount > _totalStepsCountToBuild
          ? _totalStepsCountToBuild
          : _completedStepsCount;

  int get _totalStepsCountToBuild =>
      structureOfADay?.totalStepsCount ?? structure.totalStepsCount;

  @override
  Widget build(BuildContext context) {
    final completedStepsCountToBuild = _completedStepsCountToBuild;
    final totalStepsCountToBuild = _totalStepsCountToBuild;

    final buildCheckIconButton =
        isStarted && completedStepsCountToBuild == totalStepsCountToBuild;
    final buildAddIconButton = !isStarted && !buildCheckIconButton;
    final buildIconButton = buildCheckIconButton || buildAddIconButton;

    final colorToBuild = color;

    final subtitle = structure.hasDescription ? structure.description! : '-';
    const trailingSize = 50.0;

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
          color: colorToBuild,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: colorToBuild,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: SizedBox(
        width: trailingSize,
        height: trailingSize,
        child: buildIconButton
            ? _StructureIconButton(
                isCompleted: buildCheckIconButton,
                structure: structure,
                structureOfADay: structureOfADay,
                isDisabled: isDisabled,
                isEditableOnly: isEditableOnly,
                date: date,
                color: colorToBuild,
              )
            : _StructureProgress(
                completedStepsCount: completedStepsCountToBuild,
                totalStepsCount: totalStepsCountToBuild,
                color: colorToBuild,
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

  Text getText() {
    return Text(
      '${widget.completedStepsCount} / ${widget.totalStepsCount}',
      style: TextStyle(
        fontSize: 10,
        color: widget.color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressColor = widget.color.withValues(alpha: 0.75);
    const strokeWidth = 4.0;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(1),
      child: SimpleCircularProgressBar(
        backColor: theme.colorScheme.surface,
        progressColors: [progressColor],
        animationDuration: 1,
        valueNotifier: _progressNotifier,
        maxValue: widget.totalStepsCount.toDouble(),
        backStrokeWidth: strokeWidth,
        progressStrokeWidth: strokeWidth,
        fullProgressColor: progressColor,
        size: 50,
        mergeMode: true,
        onGetText: (double value) {
          return getText();
        },
      ),
    );
  }
}
