part of '../router.dart';

final _homeRoute = GoRoute(
  name: RoutesNames.dailyStructures,
  path: '/${RoutesNames.dailyStructures}',
  builder: (context, state) => const DailyStructuresPage(),
);
