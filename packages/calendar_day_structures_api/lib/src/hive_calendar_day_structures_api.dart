import 'dart:async';
import 'dart:convert';

import 'package:calendar_day_structures_api/src/calendar_day_structures_api.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:structures_api/structures_api.dart';

/// {@template hive_calendar_day_structures_api}
/// Implementation of CalendarDayStructuresApi that uses Hive.
/// {@endtemplate}
class HiveCalendarDayStructuresApi implements CalendarDayStructuresApi {
  /// {@macro hive_calendar_day_structures_api}
  HiveCalendarDayStructuresApi({
    required Box<String> calendarDayStructuresBox,
  }) : _calendarDayStructuresBox = calendarDayStructuresBox;

  final Box<String> _calendarDayStructuresBox;
  final _calendarDayStructuresStreamController =
      StreamController<List<CalendarDayStructure>>.broadcast();

  @override
  Stream<List<CalendarDayStructure>> getCalendarDayStructures() {
    _getCalendarDayStructuresFromHive()
        .then(_calendarDayStructuresStreamController.add);

    return _calendarDayStructuresStreamController.stream;
  }

  @override
  Stream<List<CalendarDayStructure>> getCalendarDayStructuresForDay(
    DateTime day,
  ) {
    _getCalendarDayStructuresForDayFromHive(day)
        .then(_calendarDayStructuresStreamController.add);

    return _calendarDayStructuresStreamController.stream;
  }

  @override
  Future<void> saveCalendarDayStructure(CalendarDayStructure structure) async {
    await _calendarDayStructuresBox.put(
      structure.id,
      jsonEncode(structure.toJson()),
    );

    _calendarDayStructuresStreamController
        .add(await _getCalendarDayStructuresFromHive());
  }

  @override
  Future<void> deleteCalendarDayStructure(String id) async {
    await _calendarDayStructuresBox.delete(id);

    _calendarDayStructuresStreamController
        .add(await _getCalendarDayStructuresFromHive());
  }

  @override
  Future<void> deleteAllCalendarDayStructuresForStructure(
    String structureId,
  ) async {
    final structures = await _getCalendarDayStructuresFromHive();

    for (final structure in structures) {
      if (structure.id == structureId) {
        await _calendarDayStructuresBox.delete(structure.id);
      }
    }

    _calendarDayStructuresStreamController
        .add(await _getCalendarDayStructuresFromHive());
  }

  Future<List<CalendarDayStructure>> _getCalendarDayStructuresFromHive() async {
    final structureJsons = _calendarDayStructuresBox.values;

    final structures = structureJsons
        .map(
          (structureJson) => CalendarDayStructure.fromJson(
            jsonDecode(structureJson) as Map<String, dynamic>,
          ),
        )
        .toList();

    return structures;
  }

  Future<List<CalendarDayStructure>> _getCalendarDayStructuresForDayFromHive(
    DateTime day,
  ) async {
    final structures = await _getCalendarDayStructuresFromHive();

    return structures.where((structure) {
      final structureDay = structure.calendarDay;
      return structureDay.year == day.year &&
          structureDay.month == day.month &&
          structureDay.day == day.day;
    }).toList();
  }
}
