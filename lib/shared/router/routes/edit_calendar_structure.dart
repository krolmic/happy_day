part of '../router.dart';

final _editCalendarStructureRoute = GoRoute(
  name: RoutesNames.editCalendarStructure,
  path: RoutesNames.editCalendarStructure,
  builder: (context, state) {
    final parameters = EditCalendarStructureRouteParameters.fromState(state);

    return EditStructurePage(
      initialStructure: parameters.initialStructure,
      isStructureAssignedToWeekDay: false,
      selectedDay: parameters.selectedDay,
    );
  },
);

/// Parameters for [RoutesNames.editCalendarStructure]
@immutable
class EditCalendarStructureRouteParameters {
  const EditCalendarStructureRouteParameters({
    required this.selectedDay,
    this.initialStructure,
  });

  /// Factory to create parameters from a [GoRouterState].
  factory EditCalendarStructureRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as EditCalendarStructureRouteParameters;

  /// [selectedDay] for the calendar structure to create.
  final DateTime selectedDay;

  /// Optional [initialStructure] if editing an existing structure.
  final Structure? initialStructure;
}
