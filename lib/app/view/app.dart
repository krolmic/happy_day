import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/onboarding/cubit/onboarding_cubit.dart';
import 'package:happy_day/shared/router/router.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:happy_day/shared/widgets/feedback_button.dart';
import 'package:onboarding_repository/onboarding_repository.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({
    required this.structuresRepository,
    required this.stepsGenerationRepository,
    required this.onboardingRepository,
    required this.showFeedbackButton,
    super.key,
  });

  final StructuresRepository structuresRepository;
  final StepsGenerationRepository stepsGenerationRepository;
  final OnboardingRepository onboardingRepository;
  final bool showFeedbackButton;
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
      ],
      child: BlocProvider(
        create: (context) => OnboardingCubit(
          onboardingRepository: context.read<OnboardingRepository>(),
        )..init(),
        child: AppView(
          showFeedbackButton: showFeedbackButton,
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    required this.showFeedbackButton,
    super.key,
  });

  final bool showFeedbackButton;

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: HappyDayTheme.theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: goRouter,
        builder: (context, child) {
          if (showFeedbackButton) {
            return Stack(
              children: [
                child!,
                const Positioned(
                  bottom: 45,
                  right: 80,
                  child: FeedbackButton(),
                ),
              ],
            );
          } else {
            return child!;
          }
        },
      ),
    );
  }
}
