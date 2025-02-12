import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit({required bool isDark}) : super(isDark);

  void toggleTheme() => emit(!state);

  @override
  bool? fromJson(Map<String, dynamic> json) => json['isDark'] as bool;

  @override
  Map<String, dynamic> toJson(bool state) => {'isDark': state};
}
