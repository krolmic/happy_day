part of '../router.dart';

final _addCalendarStructureRoute = GoRoute(
  name: RoutesNames.addCalendarStructure,
  path: '/${RoutesNames.addCalendarStructure}',
  builder: (context, state) {
    final parameters = EditCalendarStructureRouteParameters.fromState(state);

    return EditStructurePage(
      initialStructure: null,
      isStructureAssignedToWeekDay: false,
      selectedDay: parameters.selectedDay,
    );
  },
);
