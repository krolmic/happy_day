part of '../edit_structure_page.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditStructureBloc>().state;

    return TextFormField(
      key: const Key('editStructureView_description_textFormField'),
      initialValue: state.description,
      cursorColor: color,
      decoration: InputDecoration(
        enabled: !state.editStatus.isLoadingOrSuccess,
        labelText: l10n.editStructureDescriptionLabel,
        labelStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        filled: true,
        fillColor: color.withOpacity(0.025),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: l10n.editStructureDescriptionHint,
        hintStyle: TextStyle(color: color.withOpacity(0.5)),
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
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
