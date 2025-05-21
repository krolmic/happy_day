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

enum ReviewField {
  whatIDidGreat,
  learnings,
  start,
  keep,
  stop,
  weeklyTargets,
}

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
  bool _reviewLoaded = false;
  bool _statsLoaded = false;

  void init() {
    emit(state.copyWith(status: WeeklyReviewStatus.loading));

    _reviewLoaded = false;
    _statsLoaded = false;

    _reviewsSub?.cancel();
    _reviewsSub = _reviewsRepository.getWeeklyReviews().listen(
      (reviews) {
        final week = _weekNumber(state.selectedDate);
        final review = reviews.firstWhere(
          (r) => r.weekNumber == week && r.year == state.selectedDate.year,
          orElse: () => WeeklyReview(
            weekNumber: week,
            year: state.selectedDate.year,
          ),
        );
        _reviewLoaded = true;
        emit(state.copyWith(review: review));
        _checkLoaded();
      },
      onError: (error, stack) {
        Fimber.e('Failed to load weekly reviews', ex: error, stacktrace: stack);
        emit(state.copyWith(status: WeeklyReviewStatus.failure));
      },
    );

    _loadStats();
  }

  int _weekNumber(DateTime date) {
    final firstThursday = DateTime(date.year, 1, 4);
    final diff = date.difference(firstThursday.subtract(Duration(days: firstThursday.weekday - 1)));
    return 1 + diff.inDays ~/ 7;
  }

  DateTime _startOfWeek(DateTime date) =>
      date.subtract(Duration(days: date.weekday - DateTime.monday));

  Future<void> _loadStats() async {
    try {
      final start = _startOfWeek(state.selectedDate);
      var done = 0;
      var inProgress = 0;
      var ongoing = 0;
      var daysTracked = 0;

      for (var i = 0; i < 7; i++) {
        final day = start.add(Duration(days: i));
        final dayStructures = await _loadStructuresOfDay(day);
        if (dayStructures.isNotEmpty) {
          daysTracked++;
        }
        for (final s in dayStructures) {
          if (s.isCompleted) {
            done++;
          } else if (s.completedStepsCount > 0) {
            inProgress++;
          } else {
            ongoing++;
          }
        }
      }

      _statsLoaded = true;
      emit(
        state.copyWith(
          doneCount: done,
          inProgressCount: inProgress,
          ongoingCount: ongoing,
          daysTracked: daysTracked,
        ),
      );
      _checkLoaded();
    } catch (e, stack) {
      Fimber.e('Failed to load weekly stats', ex: e, stacktrace: stack);
      emit(state.copyWith(status: WeeklyReviewStatus.failure));
    }
  }

  Future<List<StructureOfADay>> _loadStructuresOfDay(DateTime day) async {
    final completer = Completer<List<StructureOfADay>>();
    final sub = _structuresRepository
        .getStructuresOfADay()
        .skip(1)
        .take(1)
        .listen(completer.complete);
    _structuresRepository.loadStructuresOfADay(day);
    final result = await completer.future;
    await sub.cancel();
    return result;
  }

  void _checkLoaded() {
    if (_reviewLoaded && _statsLoaded) {
      emit(state.copyWith(status: WeeklyReviewStatus.success));
    }
  }

  Future<void> previousWeek() async {
    final newDate = state.selectedDate.subtract(const Duration(days: 7));
    emit(
      state.copyWith(
        selectedDate: newDate,
        status: WeeklyReviewStatus.loading,
        doneCount: 0,
        inProgressCount: 0,
        ongoingCount: 0,
        daysTracked: 0,
      ),
    );
    init();
  }

  Future<void> nextWeek() async {
    final newDate = state.selectedDate.add(const Duration(days: 7));
    emit(
      state.copyWith(
        selectedDate: newDate,
        status: WeeklyReviewStatus.loading,
        doneCount: 0,
        inProgressCount: 0,
        ongoingCount: 0,
        daysTracked: 0,
      ),
    );
    init();
  }

  Future<void> saveField(ReviewField field, String value) async {
    try {
      final week = _weekNumber(state.selectedDate);
      var review = state.review ??
          WeeklyReview(weekNumber: week, year: state.selectedDate.year);

      switch (field) {
        case ReviewField.whatIDidGreat:
          review = review.copyWith(whatIDidGreat: value);
          break;
        case ReviewField.learnings:
          review = review.copyWith(learnings: value);
          break;
        case ReviewField.start:
          review = review.copyWith(start: value);
          break;
        case ReviewField.keep:
          review = review.copyWith(keep: value);
          break;
        case ReviewField.stop:
          review = review.copyWith(stop: value);
          break;
        case ReviewField.weeklyTargets:
          review = review.copyWith(weeklyTargets: value);
          break;
      }

      await _reviewsRepository.saveWeeklyReview(review);
      emit(state.copyWith(review: review));
    } catch (e, stack) {
      Fimber.e('Failed to save review', ex: e, stacktrace: stack);
      emit(state.copyWith(status: WeeklyReviewStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _reviewsSub?.cancel();
    return super.close();
  }
}
