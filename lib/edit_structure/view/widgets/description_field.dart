part of '../edit_structure_page.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final state = context.watch<EditStructureBloc>().state;

    return TextFormField(
      key: const Key('editStructureView_description_textFormField'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: !state.status.isLoadingOrSuccess,
        labelText: l10n.editStructureDescriptionLabel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLength: 300,
      maxLines: 7,
      inputFormatters: [
        LengthLimitingTextInputFormatter(300),
      ],
      onChanged: (value) {
        context
            .read<EditStructureBloc>()
            .add(EditStructureEvent.descriptionChanged(value));
      },
    );
  }
}
