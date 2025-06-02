import 'dart:ui';

import 'package:calendar_day_structures_repository/calendar_day_structures_repository.dart';
import 'package:email_repository/email_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/onboarding/cubit/onboarding_cubit.dart';
import 'package:happy_day/shared/router/router.dart';
import 'package:happy_day/theme/cubit/theme_cubit.dart';
import 'package:happy_day/theme/theme.dart';
import 'package:onboarding_repository/onboarding_repository.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({
    required this.structuresRepository,
    required this.stepsGenerationRepository,
    required this.onboardingRepository,
    required this.emailRepository,
    required this.calendarDayStructuresRepository,
    super.key,
  });

  final StructuresRepository structuresRepository;
  final StepsGenerationRepository stepsGenerationRepository;
  final OnboardingRepository onboardingRepository;
  final EmailRepository emailRepository;
  final CalendarDayStructuresRepository calendarDayStructuresRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: structuresRepository,
        ),
        RepositoryProvider.value(
          value: stepsGenerationRepository,
        ),
        RepositoryProvider.value(
          value: onboardingRepository,
        ),
        RepositoryProvider.value(
          value: emailRepository,
        ),
        RepositoryProvider.value(
          value: calendarDayStructuresRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingCubit(
              onboardingRepository: context.read<OnboardingRepository>(),
            )..init(),
          ),
          BlocProvider(
            create: (context) {
              final brightness = PlatformDispatcher.instance.platformBrightness;
              return ThemeCubit(isDark: brightness == Brightness.dark);
            },
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, themeIsDark) {
        return ToastificationWrapper(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: HappyDayTheme.theme,
            darkTheme: HappyDayTheme.darkTheme,
            themeMode: themeIsDark ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: goRouter,
          ),
        );
      },
    );
  }
}
