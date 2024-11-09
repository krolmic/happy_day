import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/view/daily_structures_page.dart';
import 'package:happy_day/shared/router/routes_names.dart';

part 'routes/daily_structures.dart';

final goRouter = GoRouter(
  initialLocation: '/${RoutesNames.dailyStructures}',
  routes: [
    _homeRoute,
  ],
);
