import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/sliver_delegate.dart';
import 'package:reviews_repository/reviews_repository.dart';
import 'package:structures_repository/structures_repository.dart';
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
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WeeklyReviewStatus.failure) {
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
    final review = state.review;
    final isLoading = state.status.isInitialOrLoading;
    final fromDate = review?.fromDate ??
        state.selectedDate
            .subtract(Duration(days: state.selectedDate.weekday - DateTime.monday));
    final toDate = fromDate.add(const Duration(days: 6));

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverDelegate(
            minHeight: 100,
            maxHeight: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                    Text(
                      '${fromDate.day}.${fromDate.month} - '
                      '${toDate.day}.${toDate.month}',
                    ),
                  ],
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
                  number: '${state.doneCount}',
                  label: l10n.done,
                  isLoading: isLoading,
                ),
                _StatsCard(
                  number: '${state.inProgressCount}',
                  label: l10n.inProgress,
                  isLoading: isLoading,
                ),
                _StatsCard(
                  number: '${state.ongoingCount}',
                  label: l10n.ongoing,
                  isLoading: isLoading,
                ),
                _StatsCard(
                  number: '${state.daysTracked}',
                  label: l10n.daysTracked,
                  isLoading: isLoading,
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
                  value: review.whatIDidGreat,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.whatIDidGreat, v),
                ),
                _ReviewField(
                  label: l10n.learnings,
                  value: review.learnings,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.learnings, v),
                ),
                _ReviewField(
                  label: l10n.start,
                  value: review.start,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.start, v),
                ),
                _ReviewField(
                  label: l10n.keep,
                  value: review.keep,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.keep, v),
                ),
                _ReviewField(
                  label: l10n.stop,
                  value: review.stop,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.stop, v),
                ),
                _ReviewField(
                  label: l10n.weeklyTargets,
                  value: review.weeklyTargets,
                  isLoading: isLoading,
                  onSave: (v) => cubit.saveField(ReviewField.weeklyTargets, v),
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
    required this.isLoading,
  });

  final String number;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewField extends StatelessWidget {
  const _ReviewField({
    required this.label,
    required this.value,
    required this.isLoading,
    required this.onSave,
  });

  final String label;
  final String value;
  final bool isLoading;
  final ValueChanged<String> onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Skeletonizer(
        enabled: isLoading,
        child: TextField(
          readOnly: true,
          controller: TextEditingController(text: value),
          decoration: InputDecoration(labelText: label),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                final controller = TextEditingController(text: value);
                return AlertDialog(
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TextField(
                      controller: controller,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(labelText: label),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
                    ),
                    TextButton(
                      onPressed: () {
                        onSave(controller.text);
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
