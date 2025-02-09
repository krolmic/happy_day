part of '../edit_structure_page.dart';

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<EditStructureBloc, EditStructureState>(
      buildWhen: (previous, current) =>
          previous.color != current.color ||
          previous.title != current.title ||
          previous.description != current.description,
      builder: (context, state) {
        final color = state.color;

        final previewStructure = Structure(
          id: 'preview',
          title: state.title,
          description: state.description,
          colorRed: (color.r * 255).toInt(),
          colorGreen: (color.g * 255).toInt(),
          colorBlue: (color.b * 255).toInt(),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: l10n.editStructurePreviewLabel,
              color: color,
            ),
            const SizedBox(
              height: 10,
            ),
            DailyStructure(
              date: DateTime.now(),
              isDisabled: true,
              isStarted: false,
              structure: previewStructure,
            ),
          ],
        );
      },
    );
  }
}
