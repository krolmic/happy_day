part of '../router.dart';

/// Parameters for the edit calendar structure route.
@immutable
class EditCalendarStructureRouteParameters {
  /// Creates a new [EditCalendarStructureRouteParameters].
  const EditCalendarStructureRouteParameters({
    required this.selectedDay,
    this.initialStructure,
  });

  /// Factory to create parameters from a [GoRouterState].
  factory EditCalendarStructureRouteParameters.fromState(
    GoRouterState state,
  ) =>
      state.extra! as EditCalendarStructureRouteParameters;

  /// The selected day for the calendar structure.
  final DateTime selectedDay;

  /// Optional initial structure if editing an existing structure.
  final Structure? initialStructure;
}
