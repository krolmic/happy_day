import 'package:structures_api/structures_api.dart';

/// {@template calendar_day_structures_api}
/// The interface and models for an API providing access
/// to calendar day structures.
/// {@endtemplate}
abstract class CalendarDayStructuresApi {
  /// {@macro calendar_day_structures_api}
  const CalendarDayStructuresApi();

  /// Get all calendar day structures.
  Stream<List<CalendarDayStructure>> getCalendarDayStructures();

  /// Get calendar day structures for a specific day.
  Stream<List<CalendarDayStructure>> getCalendarDayStructuresForDay(
    DateTime day,
  );

  /// Save a calendar day structure.
  Future<void> saveCalendarDayStructure(CalendarDayStructure structure);

  /// Delete a calendar day structure.
  Future<void> deleteCalendarDayStructure(String id);

  /// Delete all calendar day structures for a given structure.
  Future<void> deleteAllCalendarDayStructuresForStructure(String structureId);
}
