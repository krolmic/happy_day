import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/view/daily_structures_page.dart';
import 'package:happy_day/shared/router/routes_names.dart';

part 'navigators.dart';
part 'routes/daily_structures.dart';

final goRouter = GoRouter(
  initialLocation: '/${RoutesNames.dailyStructures}',
  navigatorKey: _rootNavigatorKey,
  routes: [
    _homeRoute,
  ],
);
