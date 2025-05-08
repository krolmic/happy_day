import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/view/daily_structures_page.dart';
import 'package:happy_day/edit_structure/view/edit_structure_page.dart';
import 'package:happy_day/onboarding/cubit/onboarding_cubit.dart';
import 'package:happy_day/onboarding/view/onboarding_page.dart';
import 'package:happy_day/settings/settings.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/structure_details/view/structure_details_page.dart';
import 'package:structures_api/structures_api.dart';

part 'routes/daily_structures.dart';
part 'routes/edit_calendar_structure.dart';
part 'routes/edit_calendar_structure_parameters.dart';
part 'routes/edit_structure.dart';
part 'routes/onboarding.dart';
part 'routes/settings.dart';
part 'routes/structure_details.dart';

final goRouter = GoRouter(
  initialLocation: '/${RoutesNames.onboarding}',
  redirect: redirectToOnboardingIfNotCompleted,
  routes: [
    _onboardingRoute,
    _dailyStructuresRoute,
    _structureDetailsRoute,
    _editStructureRoute,
    _editCalendarStructureRoute,
    _settingsRoute,
  ],
);

FutureOr<String?> redirectToOnboardingIfNotCompleted(
  BuildContext context,
  GoRouterState state,
) {
  final isOnboardingCompleted =
      context.read<OnboardingCubit>().state.isCompleted;
  final isOnboardingRoute =
      state.matchedLocation == '/${RoutesNames.onboarding}';

  if (isOnboardingCompleted && isOnboardingRoute) {
    return '/${RoutesNames.dailyStructures}';
  }

  if (!isOnboardingCompleted && !isOnboardingRoute) {
    return '/${RoutesNames.onboarding}';
  }

  return null;
}
