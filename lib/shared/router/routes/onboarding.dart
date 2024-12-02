part of '../router.dart';

final _onboardingRoute = GoRoute(
  name: RoutesNames.onboarding,
  path: '/${RoutesNames.onboarding}',
  builder: (context, state) => const OnboardingPage(),
);
