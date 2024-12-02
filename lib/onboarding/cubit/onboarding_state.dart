part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _OnboardingInitialState;
  const factory OnboardingState.completed() = _OnboardingCompletedState;
  const factory OnboardingState.error() = _OnboardingErrorState;
}

extension OnboardingStateX on OnboardingState {
  bool get isCompleted => this is _OnboardingCompletedState;
  bool get isError => this is _OnboardingErrorState;
}
