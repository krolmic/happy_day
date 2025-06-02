part of '../router.dart';

final _addStructureRoute = GoRoute(
  name: RoutesNames.addStructure,
  path: '/${RoutesNames.addStructure}',
  builder: (context, state) => const EditStructurePage(
    initialStructure: null,
  ),
);
