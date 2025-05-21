import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reviews_api/reviews_api.dart';

/// {@template local_reviews_api}
/// A Flutter implementation of the ReviewsApi that uses local storage.
/// {@endtemplate}
class LocalReviewsApi extends ReviewsApi {
  /// {@macro local_reviews_api}
  LocalReviewsApi({required SharedPreferences plugin}) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _reviewsStreamController =
      BehaviorSubject<List<WeeklyReview>>.seeded(const []);

  /// The key used for storing the reviews locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kReviewsCollectionKey = '__reviews_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) => _plugin.setString(key, value);

  void _init() {
    final reviewsJson = _getValue(kReviewsCollectionKey);
    if (reviewsJson != null) {
      final reviews = List<Map<dynamic, dynamic>>.from(
        json.decode(reviewsJson) as List,
      )
          .map((jsonMap) =>
              WeeklyReview.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _reviewsStreamController.add(reviews);
    } else {
      _reviewsStreamController.add(const []);
    }
  }

  @override
  Stream<List<WeeklyReview>> getWeeklyReviews() =>
      _reviewsStreamController.asBroadcastStream();

  @override
  Future<void> saveWeeklyReview(WeeklyReview review) async {
    final reviews = [..._reviewsStreamController.value];
    final index = reviews.indexWhere(
      (r) => r.weekNumber == review.weekNumber && r.year == review.year,
    );
    if (index >= 0) {
      reviews[index] = review;
    } else {
      reviews.add(review);
    }
    _reviewsStreamController.add(reviews);
    await _setValue(kReviewsCollectionKey, json.encode(reviews));
  }

  @override
  Future<void> deleteWeeklyReview(int weekNumber, int year) async {
    final reviews = [..._reviewsStreamController.value];
    final index = reviews.indexWhere(
      (r) => r.weekNumber == weekNumber && r.year == year,
    );
    if (index == -1) {
      throw WeeklyReviewNotFoundException();
    }
    reviews.removeAt(index);
    _reviewsStreamController.add(reviews);
    await _setValue(kReviewsCollectionKey, json.encode(reviews));
  }

  @override
  Future<void> close() async {
    await _reviewsStreamController.close();
  }
}
