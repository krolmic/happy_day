import 'package:shared_preferences/shared_preferences.dart';

/// {@template onboarding_repository}
/// Repository for managing onboarding data
/// {@endtemplate}
class OnboardingRepository {
  /// {@macro onboarding_repository}
  const OnboardingRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;
  static const _onboardingCompletedKey = 'onboarding_completed';

  /// Returns true if onboarding has been completed
  bool isOnboardingCompleted() {
    return _sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
  }

  /// Marks onboarding as completed
  Future<void> completeOnboarding() async {
    await _sharedPreferences.setBool(_onboardingCompletedKey, true);
  }
}
