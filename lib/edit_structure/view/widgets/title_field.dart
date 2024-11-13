part of '../edit_structure_page.dart';

class TitleField extends StatelessWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditStructureBloc>().state;

    return TextFormField(
      autofocus: true,
      key: const Key('editStructureView_title_textFormField'),
      initialValue: state.title,
      decoration: InputDecoration(
        enabled: !state.status.isLoadingOrSuccess,
        labelText: l10n.editStructureTitleLabel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLength: 50,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
      ],
      onChanged: (value) {
        context
            .read<EditStructureBloc>()
            .add(EditStructureEvent.titleChanged(value));
      },
    );
  }
}
