import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_day/gen/assets.gen.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/widgets/steps_indicator.dart';

class OnboardingWizard extends StatefulWidget {
  const OnboardingWizard({super.key});

  @override
  State<OnboardingWizard> createState() => _OnboardingWizardState();
}

class _OnboardingWizardState extends State<OnboardingWizard> {
  final PageController _pageController = PageController();
  late final Timer _autoPlayTimer;
  int _currentPageIndex = 0;

  static const _autoPlayDuration = Duration(seconds: 4);
  static const _nextPageDuration = Duration(milliseconds: 300);
  static const _repeatPageDuration = Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(_autoPlayDuration, (timer) {
      if (_currentPageIndex < 2) {
        _pageController.nextPage(
          duration: _nextPageDuration,
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: _repeatPageDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final imageWidth = MediaQuery.of(context).size.width * 0.6;

    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              _OnboardingWizardPage(
                image: SvgPicture.asset(
                  Assets.vectors.onboardingAdd,
                  width: imageWidth,
                ),
                title: l10n.onboardingHeadingAdd,
                subtitle: l10n.onboardingDescriptionAdd,
              ),
              _OnboardingWizardPage(
                image: SvgPicture.asset(
                  Assets.vectors.onboardingGenerate,
                  width: imageWidth,
                ),
                title: l10n.onboardingHeadingGenerate,
                subtitle: l10n.onboardingDescriptionGenerate,
              ),
              _OnboardingWizardPage(
                image: SvgPicture.asset(
                  Assets.vectors.onboardingTrack,
                  width: imageWidth,
                ),
                title: l10n.onboardingHeadingTrack,
                subtitle: l10n.onboardingDescriptionTrack,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
          child: StepsIndicator(
            stepsCount: 3,
            currentStep: _currentPageIndex + 1,
          ),
        ),
      ],
    );
  }
}

class _OnboardingWizardPage extends StatelessWidget {
  const _OnboardingWizardPage({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final Widget image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(height: 15),
          Text(
            title,
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
