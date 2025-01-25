import 'package:happy_day/shared/extensions/datetime.dart';
import 'package:structures_api/structures_api.dart';

/// Service responsible for managing structure availability
/// and status for a specific day.
class StructureAvailabilityService {
  const StructureAvailabilityService();

  /// Whether [StructureOfADay] assigned to a [structure] on given [date]
  /// exists in [structuresOfDay].
  bool isStructureStarted(
    Structure structure,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    return getStructureOfADay(structure, date, structuresOfDay) != null;
  }

  /// Returns [StructureOfADay] assigned to a [structure] on given [date].
  ///
  /// Returns `null` if there is no [StructureOfADay]assigned to given
  /// [structure] on given [date].
  StructureOfADay? getStructureOfADay(
    Structure structure,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    final structureOfADay = structuresOfDay.firstWhere(
      (s) => s.structureId == structure.id && s.date.isSameDay(date),
      orElse: StructureOfADay.none,
    );

    return structureOfADay.isNone ? null : structureOfADay;
  }

  /// Whether a [structure] can only be edited on given [date].
  ///
  /// Conditions:
  /// - Structure is not assigned to the current weekday
  /// - Structure has not been started
  bool canStructureOnlyBeEdited(
    Structure structure,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    final isAssignedToWeekday = structure.isAssignedToWeekDay(date.weekday - 1);
    final hasStarted = isStructureStarted(structure, date, structuresOfDay);

    return !isAssignedToWeekday && !hasStarted;
  }

  /// Returns structures that are either assigned to the given [date]'s weekday
  /// or have been already started on that date.
  List<Structure> _getStructuresForDateWeekday(
    List<Structure> structures,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    return structures.where((structure) {
      return structure.isAssignedToWeekDay(date.weekday - 1) ||
          isStructureStarted(structure, date, structuresOfDay);
    }).toList();
  }

  /// Returns structures that are neither assigned to the given [date]'s weekday
  /// nor have been started on that date.
  List<Structure> _getStructuresNotForDateWeekday(
    List<Structure> structures,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    return structures.where((structure) {
      return !structure.isAssignedToWeekDay(date.weekday - 1) &&
          !isStructureStarted(structure, date, structuresOfDay);
    }).toList();
  }

  List<Structure> getSortedStructures(
    List<Structure> structures,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    if (structures.isEmpty) return [];

    final structuresForSelectedDay = _getStructuresForDateWeekday(
      structures,
      date,
      structuresOfDay,
    );
    final structuresNotForSelectedDay = _getStructuresNotForDateWeekday(
      structures,
      date,
      structuresOfDay,
    );

    return [...structuresForSelectedDay, ...structuresNotForSelectedDay];
  }
}
