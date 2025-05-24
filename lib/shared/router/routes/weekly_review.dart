part of '../router.dart';

final _weeklyReviewRoute = GoRoute(
  name: RoutesNames.weeklyReview,
  path: '/${RoutesNames.weeklyReview}',
  builder: (context, state) => const WeeklyReviewPage(),
);
