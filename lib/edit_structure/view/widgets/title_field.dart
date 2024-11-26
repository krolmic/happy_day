part of '../edit_structure_page.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(krolmic): use parameters
    final state = context.watch<EditStructureBloc>().state;

    return TextFormField(
      autofocus: true,
      key: const Key('editStructureView_title_textFormField'),
      initialValue: state.title,
      cursorColor: color,
      decoration: InputDecoration(
        enabled: !state.editStatus.isLoadingOrSuccess,
        labelText: '${l10n.editStructureTitleLabel} *',
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
        hintText: l10n.editStructureTitleHint,
        hintStyle: TextStyle(color: color.withOpacity(0.5)),
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
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
