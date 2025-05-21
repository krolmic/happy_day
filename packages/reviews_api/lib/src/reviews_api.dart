import 'package:reviews_api/reviews_api.dart';

/// {@template reviews_api}
/// The interface for an API that provides access to weekly reviews.
/// {@endtemplate}
abstract class ReviewsApi {
  /// {@macro reviews_api}
  const ReviewsApi();

  /// Provides a stream of all weekly reviews.
  Stream<List<WeeklyReview>> getWeeklyReviews();

  /// Saves a [review]. If a review for the same week already exists, it
  /// will be replaced.
  Future<void> saveWeeklyReview(WeeklyReview review);

  /// Deletes the review for the given [weekNumber] and [year].
  Future<void> deleteWeeklyReview(int weekNumber, int year);

  /// Closes the underlying resources.
  Future<void> close();
}

/// Error thrown when a review for a given week is not found.
class WeeklyReviewNotFoundException implements Exception {}
