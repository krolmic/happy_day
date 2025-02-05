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

    return SliverFixedExtentList(
      itemExtent: 80,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final structure = structuresToDisplay[index];
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
        childCount: structuresToDisplay.length,
      ),
    );
  }
}
