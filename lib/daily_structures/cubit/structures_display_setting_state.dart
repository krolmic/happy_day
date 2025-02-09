part of 'structures_display_setting_cubit.dart';

enum StructuresDisplaySettingState { all, weekday }

extension StructuresDisplaySettingStateX on StructuresDisplaySettingState {
  bool get isAll => this == StructuresDisplaySettingState.all;
}
