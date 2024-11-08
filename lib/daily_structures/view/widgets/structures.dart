part of '../daily_structures_page.dart';

class Structures extends StatelessWidget {
  const Structures({super.key});

  @override
  Widget build(BuildContext context) {
    final structures = List.generate(
      5,
      (index) => Structure(
        name: 'Structure $index',
        description: 'Structure description $index',
        isCompleted: index.isOdd && index != 0,
        isStarted: !index.isOdd && index != 0,
        completedStepsCount: 2,
        totalStepsCount: 3,
      ),
    );

    return SliverFixedExtentList(
      itemExtent: 80,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final structure = structures[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: structure,
          );
        },
        childCount: structures.length,
      ),
    );
  }
}
