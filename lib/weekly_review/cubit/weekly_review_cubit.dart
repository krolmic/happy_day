import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reviews_repository/reviews_repository.dart';
import 'package:reviews_api/reviews_api.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:structures_api/structures_api.dart';

part 'weekly_review_cubit.freezed.dart';
part 'weekly_review_state.dart';

class WeeklyReviewCubit extends Cubit<WeeklyReviewState> {
  WeeklyReviewCubit({
    required ReviewsRepository reviewsRepository,
    required StructuresRepository structuresRepository,
  })  : _reviewsRepository = reviewsRepository,
        _structuresRepository = structuresRepository,
        super(
          WeeklyReviewState(
            selectedDate: DateTime.now(),
            review: null,
          ),
        );

  final ReviewsRepository _reviewsRepository;
  final StructuresRepository _structuresRepository;

  StreamSubscription<List<WeeklyReview>>? _reviewsSub;
  StreamSubscription<List<StructureOfADay>>? _structuresSub;

  void init() {
    emit(
      state.copyWith(
        reviewStatus: WeeklyReviewStatus.loading,
        statsStatus: WeeklyReviewStatus.loading,
      ),
    );

    _initReviews();
    _initStructures();
  }

  void _initReviews() {
    _reviewsSub?.cancel();
    _reviewsSub = _reviewsRepository.getWeeklyReviews().listen(
      (reviews) {
        final week = _weekNumber(state.selectedDate);
        final index = reviews.indexWhere(
          (r) => r.weekNumber == week && r.year == state.selectedDate.year,
        );
        final review = index >= 0 ? reviews[index] : null;
        emit(
          state.copyWith(
            review: review,
            reviewStatus: WeeklyReviewStatus.success,
          ),
        );
      },
      onError: (error, stack) {
        Fimber.e('Failed to load weekly reviews', ex: error, stacktrace: stack);
        emit(state.copyWith(reviewStatus: WeeklyReviewStatus.failure));
      },
    );
  }

  void _initStructures() {
    _structuresSub?.cancel();
    _structuresSub = _structuresRepository.getStructuresOfADay().listen(
      (structuresOfADay) {
        final from = _startOfWeek(state.selectedDate);
        final to = from.add(const Duration(days: 6));
        final weekStructures = structuresOfADay.where(
          (s) => !s.date.isBefore(from) && !s.date.isAfter(to),
        );

        var done = 0;
        var inProgress = 0;
        final trackedDays = <DateTime>{};

        for (final s in weekStructures) {
          trackedDays.add(DateTime(s.date.year, s.date.month, s.date.day));
          if (s.isCompleted) {
            done++;
          } else {
            inProgress++;
          }
        }

        emit(
          state.copyWith(
            doneCount: done,
            inProgressCount: inProgress,
            ongoingCount: 0,
            daysTracked: trackedDays.length,
            statsStatus: WeeklyReviewStatus.success,
          ),
        );
      },
      onError: (error, stack) {
        Fimber.e('Failed to load structures', ex: error, stacktrace: stack);
        emit(state.copyWith(statsStatus: WeeklyReviewStatus.failure));
      },
    );

    final from = _startOfWeek(state.selectedDate);
    for (var i = 0; i < 7; i++) {
      _structuresRepository.loadStructuresOfADay(from.add(Duration(days: i)));
    }
  }

  int _weekNumber(DateTime date) {
    final firstThursday = DateTime(date.year, 1, 4);
    final diff = date.difference(firstThursday.subtract(Duration(days: firstThursday.weekday - 1)));
    return 1 + diff.inDays ~/ 7;
  }

  int weekNumberFor(DateTime date) => _weekNumber(date);

  Future<void> previousWeek() async {
    final newDate = state.selectedDate.subtract(const Duration(days: 7));
    emit(
      state.copyWith(
        selectedDate: newDate,
        reviewStatus: WeeklyReviewStatus.loading,
        statsStatus: WeeklyReviewStatus.loading,
      ),
    );
    init();
  }

  Future<void> nextWeek() async {
    final newDate = state.selectedDate.add(const Duration(days: 7));
    emit(
      state.copyWith(
        selectedDate: newDate,
        reviewStatus: WeeklyReviewStatus.loading,
        statsStatus: WeeklyReviewStatus.loading,
      ),
    );
    init();
  }

  Future<void> saveReview({
    String? whatIDidGreat,
    String? learnings,
    String? start,
    String? keep,
    String? stop,
    String? weeklyTargets,
  }) async {
    final existing = state.review ??
        WeeklyReview(
          weekNumber: _weekNumber(state.selectedDate),
          year: state.selectedDate.year,
        );

    final updated = existing.copyWith(
      whatIDidGreat: whatIDidGreat ?? existing.whatIDidGreat,
      learnings: learnings ?? existing.learnings,
      start: start ?? existing.start,
      keep: keep ?? existing.keep,
      stop: stop ?? existing.stop,
      weeklyTargets: weeklyTargets ?? existing.weeklyTargets,
    );

    await _reviewsRepository.saveWeeklyReview(updated);

    emit(state.copyWith(review: updated));
  }

  DateTime _startOfWeek(DateTime date) {
    final jan4 = DateTime(date.year, 1, 4);
    final firstMonday = jan4.subtract(Duration(days: jan4.weekday - 1));
    final week = _weekNumber(date);
    return firstMonday.add(Duration(days: 7 * (week - 1)));
  }

  @override
  Future<void> close() {
    _reviewsSub?.cancel();
    _structuresSub?.cancel();
    return super.close();
  }
}
