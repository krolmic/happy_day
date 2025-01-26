part of '../daily_structures_page.dart';

class DisplaySetting extends StatelessWidget {
  const DisplaySetting({
    required this.selectedSetting,
    required this.onSelectionChanged,
    super.key,
  });

  final StructuresToDisplaySetting selectedSetting;
  final void Function(Set<StructuresToDisplaySetting>) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SegmentedButton<StructuresToDisplaySetting>(
      style: SegmentedButton.styleFrom(
        side: const BorderSide(color: HappyDayTheme.primaryColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: Colors.transparent,
        selectedBackgroundColor: HappyDayTheme.primaryColor,
        selectedForegroundColor: Colors.white,
        foregroundColor: HappyDayTheme.primaryColor,
        iconColor: Colors.white,
      ),
      segments: <ButtonSegment<StructuresToDisplaySetting>>[
        ButtonSegment<StructuresToDisplaySetting>(
          value: StructuresToDisplaySetting.all,
          label: Text(l10n.all),
          icon: Icon(
            Icons.list,
            color: selectedSetting == StructuresToDisplaySetting.all
                ? Colors.white
                : HappyDayTheme.primaryColor,
          ),
        ),
        ButtonSegment<StructuresToDisplaySetting>(
          value: StructuresToDisplaySetting.weekday,
          label: Text(l10n.weekday),
          icon: Icon(
            Icons.calendar_view_day,
            color: selectedSetting == StructuresToDisplaySetting.weekday
                ? Colors.white
                : HappyDayTheme.primaryColor,
          ),
        ),
      ],
      selected: <StructuresToDisplaySetting>{
        selectedSetting,
      },
      onSelectionChanged: onSelectionChanged,
    );
  }
}
