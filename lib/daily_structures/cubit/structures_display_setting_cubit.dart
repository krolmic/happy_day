import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'structures_display_setting_state.dart';

class StructuresDisplaySettingCubit
    extends HydratedCubit<StructuresDisplaySettingState> {
  StructuresDisplaySettingCubit() : super(StructuresDisplaySettingState.all);

  void setSetting(StructuresDisplaySettingState setting) => emit(setting);

  @override
  StructuresDisplaySettingState fromJson(Map<String, dynamic> json) =>
      StructuresDisplaySettingState.values[json['value'] as int];

  @override
  Map<String, dynamic> toJson(StructuresDisplaySettingState state) =>
      {'value': state.index};
}
