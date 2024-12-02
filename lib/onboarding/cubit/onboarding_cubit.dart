import 'package:bloc/bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onboarding_repository/onboarding_repository.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required OnboardingRepository onboardingRepository,
  })  : _onboardingRepository = onboardingRepository,
        super(const OnboardingState.initial());

  final OnboardingRepository _onboardingRepository;

  void init() {
    try {
      final isCompleted = _onboardingRepository.isOnboardingCompleted();
      if (isCompleted) {
        emit(const OnboardingState.completed());
      }
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to init onboarding',
        ex: error,
        stacktrace: stackTrace,
      );

      emit(const OnboardingState.error());
    }
  }

  Future<void> completeOnboarding() async {
    try {
      await _onboardingRepository.completeOnboarding();
      emit(const OnboardingState.completed());
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to complete onboarding',
        ex: error,
        stacktrace: stackTrace,
      );

      emit(const OnboardingState.error());
    }
  }
}
