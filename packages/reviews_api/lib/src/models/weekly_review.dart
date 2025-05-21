import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_review.freezed.dart';
part 'weekly_review.g.dart';

/// A review of a specific week of a year.
@freezed
class WeeklyReview with _$WeeklyReview {
  /// Creates a new [WeeklyReview].
  factory WeeklyReview({
    required int weekNumber,
    required int year,
    @Default('') String whatIDidGreat,
    @Default('') String learnings,
    @Default('') String start,
    @Default('') String keep,
    @Default('') String stop,
    @Default('') String weeklyTargets,
  }) = _WeeklyReview;

  WeeklyReview._();

  /// Creates a new [WeeklyReview] from a JSON object.
  factory WeeklyReview.fromJson(Map<String, Object?> json) =>
      _$WeeklyReviewFromJson(json);

  /// Returns the first day date of this review week.
  DateTime get fromDate {
    final jan4 = DateTime(year, 1, 4);
    final firstMonday = jan4.subtract(Duration(days: jan4.weekday - 1));
    return firstMonday.add(Duration(days: 7 * (weekNumber - 1)));
  }

  /// Returns the last day date of this review week.
  DateTime get toDate => fromDate.add(const Duration(days: 6));
}
