import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/onboarding/cubit/onboarding_cubit.dart';
import 'package:happy_day/onboarding/view/widgets/onboarding_wizard.dart';
import 'package:happy_day/shared/router/routes_names.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<OnboardingCubit>();

    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        // If onboarding is completed or error, go to daily structures.
        // It makes more sense to skip onboarding instead of showing an error
        // in this case.
        if (state.isCompleted || state.isError) {
          context.goNamed(RoutesNames.dailyStructures);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Expanded(
                  child: OnboardingWizard(),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: cubit.completeOnboarding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(l10n.onboardingButtonLabel),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
