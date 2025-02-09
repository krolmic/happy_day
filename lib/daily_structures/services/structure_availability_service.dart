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
  /// Returns `null` if there is no [StructureOfADay] assigned to given
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

  /// Whether a [structure] is available on a given [date].
  ///
  /// Conditions:
  /// - Structure is assigned to [date]'s weekday OR
  /// - Structure has been started on that [date]
  bool isStructureAvailable(
    Structure structure,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    final isAssignedToWeekday = structure.isAssignedToWeekDay(date.weekday - 1);
    final hasStarted = isStructureStarted(structure, date, structuresOfDay);

    return isAssignedToWeekday || hasStarted;
  }

  /// Returns structures that are available on the given [date].
  List<Structure> getAvailableStructures(
    List<Structure> structures,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    return structures.where((structure) {
      return isStructureAvailable(structure, date, structuresOfDay);
    }).toList();
  }

  /// Returns structures that are not available on the given [date]:
  /// - neither assigned to the given [date]'s weekday
  /// - nor have been started on that [date].
  List<Structure> getUnavailableStructures(
    List<Structure> structures,
    DateTime date,
    List<StructureOfADay> structuresOfDay,
  ) {
    return structures.where((structure) {
      return !isStructureAvailable(structure, date, structuresOfDay);
    }).toList();
  }
}
