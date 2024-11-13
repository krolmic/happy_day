part of '../edit_structure_page.dart';

class ColorSelection extends StatelessWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final color = context.select(
      (EditStructureBloc bloc) => bloc.state.color,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: l10n.editStructureColorLabel),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            final bloc = context.read<EditStructureBloc>();
            Color? selectedColor;

            final result = await ColorPicker(
              onColorChanged: (Color color) {
                selectedColor = color;
              },
              customColorSwatchesAndNames: {
                Colors.amber: 'Amber',
                Colors.orange: 'Orange',
                Colors.deepOrange: 'Deep Orange',
                Colors.red: 'Red',
                Colors.pink: 'Pink',
                Colors.cyan: 'Cyan',
                Colors.blue: 'Blue',
                Colors.indigo: 'Indigo',
                Colors.lightGreen: 'Lime',
                Colors.green: 'Green',
                Colors.teal: 'Teal',
                Colors.deepPurpleAccent: 'Deep Purple Accent',
                Colors.purple: 'Purple',
                Colors.deepPurple: 'Deep Purple',
                Colors.brown: 'Brown',
                Colors.blueGrey: 'Blue Grey',
                Colors.grey: 'Grey',
              },
              enableShadesSelection: false,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.both: false,
                ColorPickerType.primary: false,
                ColorPickerType.accent: false,
                ColorPickerType.bw: false,
                ColorPickerType.custom: true,
                ColorPickerType.customSecondary: false,
                ColorPickerType.wheel: false,
              },
              width: 30,
              height: 30,
              borderRadius: 10,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ).showPickerDialog(
              context,
              actionsPadding: const EdgeInsets.only(
                bottom: 15,
                left: 15,
                right: 15,
              ),
              titlePadding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
              ),
              title: Label(
                text: l10n.editStructureSelectColorLabel,
                isActive: true,
              ),
            );

            if (result && selectedColor != null) {
              bloc.add(
                EditStructureEvent.colorChanged(selectedColor!),
              );
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
