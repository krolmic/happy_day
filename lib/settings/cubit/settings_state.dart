part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SendEmailState.initial()) SendEmailState sendEmailState,
  }) = _SettingsState;
}

@freezed
class SendEmailState with _$SendEmailState {
  const factory SendEmailState.initial() = _SendEmailStateInitialState;
  const factory SendEmailState.loading() = _SendEmailStateLoadingState;
  const factory SendEmailState.success() = _SendEmailStateSuccessState;
  const factory SendEmailState.failure() = _SendEmailStateFailureState;
}

extension SendEmailStateX on SendEmailState {
  bool get isInitial => this is _SendEmailStateInitialState;
  bool get isLoading => this is _SendEmailStateLoadingState;
  bool get isSuccess => this is _SendEmailStateSuccessState;
  bool get isFailure => this is _SendEmailStateFailureState;
}
