part of '../daily_structures_page.dart';

class DailyStructures extends StatelessWidget {
  const DailyStructures({
    required this.isLoading,
    this.structures = const [],
    this.structuresOfADay = const [],
    super.key,
  });

  final bool isLoading;
  final List<Structure> structures;
  final List<StructureOfADay> structuresOfADay;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DailyStructuresCubit>();

    final structuresToDisplay = isLoading
        ? List.generate(
            5,
            (index) => Structure.empty(),
          )
        : structures;

    final currentWeekdayStructures =
        cubit.getActiveStructures(structuresToDisplay);

    final onlyEditableStructures =
        cubit.getOnlyEditableStructures(structuresToDisplay);

    final showDivider = currentWeekdayStructures.isNotEmpty &&
        onlyEditableStructures.isNotEmpty;

    return SliverFixedExtentList(
      itemExtent: 80,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (showDivider && index == currentWeekdayStructures.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(),
            );
          }

          final currentIndex =
              showDivider && index > currentWeekdayStructures.length
                  ? index - 1
                  : index;

          final structure = index < currentWeekdayStructures.length
              ? currentWeekdayStructures[index]
              : onlyEditableStructures[
                  currentIndex - currentWeekdayStructures.length];

          return Padding(
            key: ValueKey(structure.id),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Skeletonizer(
              enabled: isLoading,
              child: BlocBuilder<DailyStructuresCubit, DailyStructuresState>(
                buildWhen: (previous, current) =>
                    previous.structuresOfADay != current.structuresOfADay,
                builder: (context, state) {
                  final structureOfADay = cubit.getStructureOfADay(structure);

                  return DailyStructure(
                    key: ValueKey(structureOfADay?.id ?? structure.id),
                    structure: structure,
                    structureOfADay: structureOfADay,
                    date: state.date,
                    isEditableOnly: cubit.canStructureOnlyBeEdited(structure),
                  );
                },
              ),
            ),
          );
        },
        childCount: showDivider
            ? structuresToDisplay.length + 1 // +1 for divider
            : structuresToDisplay.length,
      ),
    );
  }
}
