part of 'weekly_review_cubit.dart';

enum WeeklyReviewStatus { initial, loading, success, failure }

@freezed
class WeeklyReviewState with _$WeeklyReviewState {
  const factory WeeklyReviewState({
    required DateTime selectedDate,
    WeeklyReview? review,
    @Default(WeeklyReviewStatus.initial) WeeklyReviewStatus reviewStatus,
    @Default(WeeklyReviewStatus.initial) WeeklyReviewStatus statsStatus,
    @Default(0) int doneCount,
    @Default(0) int inProgressCount,
    @Default(0) int ongoingCount,
    @Default(0) int daysTracked,
  }) = _WeeklyReviewState;

  const WeeklyReviewState._();

  bool get isLoading =>
      reviewStatus == WeeklyReviewStatus.loading ||
      statsStatus == WeeklyReviewStatus.loading;
}
