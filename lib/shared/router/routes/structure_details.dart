part of '../router.dart';

final _structureDetailsRoute = GoRoute(
  name: RoutesNames.structureDetails,
  path: '/${RoutesNames.structureDetails}',
  builder: (context, state) {
    final parameters = StructureDetailsRouteParameters.fromState(state);
    return StructureDetailsPage(
      structure: parameters.structure,
      date: parameters.date,
      structureOfADay: parameters.structureOfADay,
    );
  },
);

@immutable
class StructureDetailsRouteParameters {
  const StructureDetailsRouteParameters({
    required this.structure,
    required this.date,
    this.structureOfADay,
  });

  factory StructureDetailsRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as StructureDetailsRouteParameters;

  final Structure structure;
  final DateTime date;
  final StructureOfADay? structureOfADay;
}
