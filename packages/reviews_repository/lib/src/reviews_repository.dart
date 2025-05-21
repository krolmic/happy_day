import 'package:reviews_api/reviews_api.dart';

/// {@template reviews_repository}
/// A repository that handles weekly reviews related requests.
/// {@endtemplate}
class ReviewsRepository {
  /// {@macro reviews_repository}
  const ReviewsRepository({required ReviewsApi reviewsApi})
      : _reviewsApi = reviewsApi;

  final ReviewsApi _reviewsApi;

  /// Provides a [Stream] of weekly reviews.
  Stream<List<WeeklyReview>> getWeeklyReviews() => _reviewsApi.getWeeklyReviews();

  /// Saves a [review].
  Future<void> saveWeeklyReview(WeeklyReview review) =>
      _reviewsApi.saveWeeklyReview(review);

  /// Deletes a review.
  Future<void> deleteWeeklyReview(int weekNumber, int year) =>
      _reviewsApi.deleteWeeklyReview(weekNumber, year);
}
