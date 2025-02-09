part of '../daily_structures_page.dart';

class DisplaySetting extends StatelessWidget {
  const DisplaySetting({
    required this.selectedSetting,
    required this.onSelectionChanged,
    super.key,
  });

  final StructuresDisplaySettingState selectedSetting;
  final void Function(Set<StructuresDisplaySettingState>) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final segmentedButtonStyle = SegmentedButton.styleFrom(
      side: const BorderSide(color: HappyDayTheme.primaryColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      backgroundColor: Colors.transparent,
      selectedBackgroundColor: HappyDayTheme.primaryColor,
      selectedForegroundColor: Colors.white,
      foregroundColor: HappyDayTheme.primaryColor,
      iconColor: Colors.white,
    );

    return SegmentedButton<StructuresDisplaySettingState>(
      style: segmentedButtonStyle,
      segments: <ButtonSegment<StructuresDisplaySettingState>>[
        ButtonSegment<StructuresDisplaySettingState>(
          value: StructuresDisplaySettingState.all,
          label: Text(l10n.all),
          icon: Icon(
            Icons.list,
            color: selectedSetting == StructuresDisplaySettingState.all
                ? Colors.white
                : HappyDayTheme.primaryColor,
          ),
        ),
        ButtonSegment<StructuresDisplaySettingState>(
          value: StructuresDisplaySettingState.weekday,
          label: Text(l10n.weekday),
          icon: Icon(
            Icons.calendar_today,
            color: selectedSetting == StructuresDisplaySettingState.weekday
                ? Colors.white
                : HappyDayTheme.primaryColor,
          ),
        ),
      ],
      selected: <StructuresDisplaySettingState>{
        selectedSetting,
      },
      onSelectionChanged: onSelectionChanged,
    );
  }
}
