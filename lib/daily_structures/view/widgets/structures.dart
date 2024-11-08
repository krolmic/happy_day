part of '../daily_structures_page.dart';

class Structures extends StatelessWidget {
  const Structures({super.key});

  @override
  Widget build(BuildContext context) {
    final structures = List.generate(
      5,
      (index) => Structure(
        name: 'Structure $index',
        description: 'Description $index',
        isCompleted: index.isOdd,
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
