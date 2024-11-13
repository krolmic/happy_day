part of '../edit_structure_page.dart';

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditStructureBloc, EditStructureState>(
      buildWhen: (previous, current) =>
          previous.color != current.color ||
          previous.title != current.title ||
          previous.description != current.description,
      builder: (context, state) {
        return DailyStructure(
          date: DateTime.now(),
          isDisabled: true,
          structure: Structure(
            id: 'preview',
            title: state.title,
            description: state.description,
            color: state.color.value,
          ),
        );
      },
    );
  }
}
