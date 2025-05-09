part of '../router.dart';

final _editCalendarStructureRoute = GoRoute(
  name: RoutesNames.editCalendarStructure,
  path: '/${RoutesNames.editCalendarStructure}',
  builder: (context, state) {
    final parameters = EditCalendarStructureRouteParameters.fromState(state);

    return EditStructurePage(
      initialStructure: parameters.initialStructure,
      isStructureAssignedToWeekDay: false,
      selectedDay: parameters.selectedDay,
    );
  },
);
