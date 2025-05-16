import 'package:calendar_day_structures_api/calendar_day_structures_api.dart';
import 'package:structures_api/structures_api.dart';

/// {@template calendar_day_structures_repository}
/// Repository for accessing calendar day structures data.
/// {@endtemplate}
class CalendarDayStructuresRepository {
  /// {@macro calendar_day_structures_repository}
  const CalendarDayStructuresRepository({
    required CalendarDayStructuresApi calendarDayStructuresApi,
  }) : _calendarDayStructuresApi = calendarDayStructuresApi;

  final CalendarDayStructuresApi _calendarDayStructuresApi;

  /// Get all calendar day structures.
  Stream<List<CalendarDayStructure>> getCalendarDayStructures() {
    return _calendarDayStructuresApi.getCalendarDayStructures();
  }

  /// Get calendar day structures for a specific day.
  Stream<List<CalendarDayStructure>> getCalendarDayStructuresForDay(
    DateTime day,
  ) {
    return _calendarDayStructuresApi.getCalendarDayStructuresForDay(day);
  }

  /// Save a calendar day structure.
  Future<void> saveCalendarDayStructure(CalendarDayStructure structure) {
    return _calendarDayStructuresApi.saveCalendarDayStructure(structure);
  }

  /// Save a calendar day structure with its steps.
  Future<void> saveCalendarDayStructureWithSteps(
    CalendarDayStructure structure,
    List<StructureStep> steps,
  ) async {
    await _calendarDayStructuresApi.saveCalendarDayStructure(structure);
  }

  /// Delete a calendar day structure.
  Future<void> deleteCalendarDayStructure(String id) {
    return _calendarDayStructuresApi.deleteCalendarDayStructure(id);
  }

  /// Delete all calendar day structures for a given structure.
  Future<void> deleteAllCalendarDayStructuresForStructure(String structureId) {
    return _calendarDayStructuresApi
        .deleteAllCalendarDayStructuresForStructure(structureId);
  }
}
