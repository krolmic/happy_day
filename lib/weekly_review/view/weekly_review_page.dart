import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/sliver_delegate.dart';
import 'package:reviews_repository/reviews_repository.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:intl/intl.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../weekly_review.dart';

class WeeklyReviewPage extends StatelessWidget {
  const WeeklyReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeeklyReviewCubit(
        reviewsRepository: context.read<ReviewsRepository>(),
        structuresRepository: context.read<StructuresRepository>(),
      )..init(),
      child: const WeeklyReviewView(),
    );
  }
}

class WeeklyReviewView extends StatelessWidget {
  const WeeklyReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeeklyReviewCubit, WeeklyReviewState>(
      listenWhen: (previous, current) =>
          previous.reviewStatus != current.reviewStatus ||
          previous.statsStatus != current.statsStatus,
      listener: (context, state) {
        if (state.reviewStatus == WeeklyReviewStatus.failure ||
            state.statsStatus == WeeklyReviewStatus.failure) {
          showErrorToastification(title: context.l10n.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.weeklyReview),
        ),
        body: const SafeArea(
          child: WeeklyReviewContent(),
        ),
      ),
    );
  }
}

class WeeklyReviewContent extends StatelessWidget {
  const WeeklyReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WeeklyReviewCubit>();
    final state = cubit.state;
    final l10n = context.l10n;
    final weekNumber = cubit.weekNumberFor(state.selectedDate);
    final reviewTemplate = WeeklyReview(weekNumber: weekNumber, year: state.selectedDate.year);
    final review = state.review ?? reviewTemplate;
    final dateFormat = DateFormat(const DateFormatter.fullDateDMonthAsStrY().format());

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverDelegate(
            minHeight: 100,
            maxHeight: 100,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(l10n.weeklyReview),
                            IconButton(
                              icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: Text(l10n.weeklyReviewInfo),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(l10n.ok),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                      ],
                    ),
                    Text(
                      '${dateFormat.format(review.fromDate)} - ${dateFormat.format(review.toDate)}',
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: cubit.previousWeek,
                        icon: const Icon(Icons.chevron_left),
                      ),
                      IconButton(
                        onPressed: cubit.nextWeek,
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _StatsCard(
                  number: state.doneCount,
                  label: l10n.done,
                  isLoading: state.statsStatus != WeeklyReviewStatus.success,
                ),
                _StatsCard(
                  number: state.inProgressCount,
                  label: l10n.inProgress,
                  isLoading: state.statsStatus != WeeklyReviewStatus.success,
                ),
                _StatsCard(
                  number: state.ongoingCount,
                  label: l10n.ongoing,
                  isLoading: state.statsStatus != WeeklyReviewStatus.success,
                ),
                _StatsCard(
                  number: state.daysTracked,
                  label: l10n.daysTracked,
                  isLoading: state.statsStatus != WeeklyReviewStatus.success,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _ReviewField(
                  label: l10n.whatIDidGreat,
                  initialValue: review.whatIDidGreat,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) =>
                      cubit.saveReview(whatIDidGreat: value),
                ),
                _ReviewField(
                  label: l10n.learnings,
                  initialValue: review.learnings,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) => cubit.saveReview(learnings: value),
                ),
                _ReviewField(
                  label: l10n.start,
                  initialValue: review.start,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) => cubit.saveReview(start: value),
                ),
                _ReviewField(
                  label: l10n.keep,
                  initialValue: review.keep,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) => cubit.saveReview(keep: value),
                ),
                _ReviewField(
                  label: l10n.stop,
                  initialValue: review.stop,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) => cubit.saveReview(stop: value),
                ),
                _ReviewField(
                  label: l10n.weeklyTargets,
                  initialValue: review.weeklyTargets,
                  isLoading:
                      state.reviewStatus != WeeklyReviewStatus.success,
                  onSaved: (value) => cubit.saveReview(weeklyTargets: value),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({
    required this.number,
    required this.label,
    this.isLoading = false,
  });

  final int number;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final child = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$number',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label, textAlign: TextAlign.center),
          ),
        ],
      ),
    );

    return Card(
      child: Skeletonizer(
        enabled: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}

class _ReviewField extends StatelessWidget {
  const _ReviewField({
    required this.label,
    required this.initialValue,
    required this.onSaved,
    required this.isLoading,
  });

  final String label;
  final String initialValue;
  final ValueChanged<String> onSaved;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    final decoration = InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(color: color),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      ),
      filled: true,
      fillColor: color.withOpacity(0.025),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Skeletonizer(
        enabled: isLoading,
        child: TextField(
          controller: TextEditingController(text: initialValue),
          readOnly: true,
          decoration: decoration,
          onTap: () {
            final controller = TextEditingController(text: initialValue);
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TextField(
                      controller: controller,
                      maxLines: null,
                      expands: true,
                      decoration: decoration,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
                    ),
                    TextButton(
                      onPressed: () {
                        onSaved(controller.text);
                        Navigator.pop(context);
                      },
                      child: Text(MaterialLocalizations.of(context).okButtonLabel),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
