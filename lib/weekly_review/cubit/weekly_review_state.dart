part of 'weekly_review_cubit.dart';

enum WeeklyReviewStatus { initial, loading, success, failure }

extension WeeklyReviewStatusX on WeeklyReviewStatus {
  bool get isInitialOrLoading =>
      this == WeeklyReviewStatus.initial || this == WeeklyReviewStatus.loading;
}

@freezed
class WeeklyReviewState with _$WeeklyReviewState {
  const factory WeeklyReviewState({
    required DateTime selectedDate,
    WeeklyReview? review,
    @Default(0) int doneCount,
    @Default(0) int inProgressCount,
    @Default(0) int ongoingCount,
    @Default(0) int daysTracked,
    @Default(WeeklyReviewStatus.initial) WeeklyReviewStatus status,
  }) = _WeeklyReviewState;
}
