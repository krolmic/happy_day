part of '../router.dart';

final _editStructureRoute = GoRoute(
  name: RoutesNames.editStructure,
  path: '/${RoutesNames.editStructure}',
  builder: (context, state) => EditStructurePage(
    initialStructure: state.extra as Structure?,
  ),
);
