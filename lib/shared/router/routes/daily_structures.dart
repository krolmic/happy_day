part of '../router.dart';

final _dailyStructuresRoute = GoRoute(
  name: RoutesNames.dailyStructures,
  path: '/${RoutesNames.dailyStructures}',
  builder: (context, state) => const DailyStructuresPage(),
  routes: [
    _structureDetailsRoute,
  ],
);
