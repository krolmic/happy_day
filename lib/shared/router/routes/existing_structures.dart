part of '../router.dart';

final _existingStructuresRoute = GoRoute(
  name: RoutesNames.existingStructures,
  path: '/${RoutesNames.existingStructures}',
  builder: (context, state) => const ExistingStructuresPage(),
  routes: [
    _editStructureRoute,
    _editCalendarStructureRoute,
  ],
);
