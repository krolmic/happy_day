import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structures_api/structures_api.dart';

/// {@template local_storage_structures_api}
/// A Flutter implementation of the StructuresApi that uses local storage.
/// {@endtemplate}
class LocalStorageStructuresApi extends StructuresApi {
  /// {@macro local_storage_structures_api}
  LocalStorageStructuresApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _structuresStreamController =
      BehaviorSubject<List<Structure>>.seeded(
    const [],
  );

  late final _structuresOfADayStreamController =
      BehaviorSubject<List<StructureOfADay>>.seeded(
    const [],
  );

  /// The key used for storing the structures locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kStructuresCollectionKey = '__structures_collection_key__';

  /// The key used for storing the steps locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kStepsCollectionKey = '__steps_collection_key__';

  /// The key used for storing the structures of a day locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kStructuresOfADayCollectionKey =
      '__structures_of_a_day_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);
  Future<void> _deleteValue(String key) => _plugin.remove(key);
  List<String> _getKeys(String prefix) =>
      _plugin.getKeys().where((key) => key.startsWith(prefix)).toList();

  /// Loads structures and structures of a day and adds them to the streams
  /// [_structuresStreamController] and [_structuresOfADayStreamController].
  void _init() {
    _loadStructures();

    loadStructuresOfADay(DateTime.now());
  }

  /// Loads structures from local storage and adds them to the stream
  /// [_structuresStreamController].
  void _loadStructures() {
    final structuresJson = _getValue(kStructuresCollectionKey);
    if (structuresJson != null) {
      final structures = List<Map<dynamic, dynamic>>.from(
        json.decode(structuresJson) as List,
      )
          .map(
            (jsonMap) => Structure.fromJson(Map<String, dynamic>.from(jsonMap)),
          )
          .toList();
      _structuresStreamController.add(structures);
    } else {
      _structuresStreamController.add(const []);
    }
  }

  /// Loads structures of a day from local storage and adds them to the stream
  /// [_structuresOfADayStreamController].
  @override
  void loadStructuresOfADay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    final structuresOfADayJson = _getValue(
      kStructuresOfADayCollectionKey + date.toIso8601String(),
    );

    if (structuresOfADayJson != null) {
      final structuresOfADay = List<Map<dynamic, dynamic>>.from(
        json.decode(structuresOfADayJson) as List,
      )
          .map(
            (jsonMap) =>
                StructureOfADay.fromJson(Map<String, dynamic>.from(jsonMap)),
          )
          .toList();
      _structuresOfADayStreamController.add(structuresOfADay);
    } else {
      _structuresOfADayStreamController.add(const []);
    }
  }

  @override
  Stream<List<Structure>> getStructures() =>
      _structuresStreamController.asBroadcastStream();

  @override
  Stream<List<StructureOfADay>> getStructuresOfADay() =>
      _structuresOfADayStreamController.asBroadcastStream();

  @override
  Future<void> saveStructureOfADay(StructureOfADay structureOfADay) async {
    final structuresOfADay = [..._structuresOfADayStreamController.value];
    final structureOfADayIndex =
        structuresOfADay.indexWhere((s) => s.id == structureOfADay.id);
    if (structureOfADayIndex >= 0) {
      structuresOfADay[structureOfADayIndex] = structureOfADay;
    } else {
      structuresOfADay.add(structureOfADay);
    }

    _structuresOfADayStreamController.add(structuresOfADay);

    final date = DateTime(
      structureOfADay.date.year,
      structureOfADay.date.month,
      structureOfADay.date.day,
    );

    return _setValue(
      kStructuresOfADayCollectionKey + date.toIso8601String(),
      json.encode(structuresOfADay),
    );
  }

  @override
  Future<void> deleteStructureOfADay(String id) async {
    final structuresOfADay = [..._structuresOfADayStreamController.value];
    final structureOfADayIndex = structuresOfADay.indexWhere((s) => s.id == id);
    if (structureOfADayIndex == -1) {
      throw StructureOfADayNotFoundException();
    } else {
      final date = DateTime(
        structuresOfADay[structureOfADayIndex].date.year,
        structuresOfADay[structureOfADayIndex].date.month,
        structuresOfADay[structureOfADayIndex].date.day,
      );
      structuresOfADay.removeAt(structureOfADayIndex);
      _structuresOfADayStreamController.add(structuresOfADay);
      return _setValue(
        kStructuresOfADayCollectionKey + date.toIso8601String(),
        json.encode(structuresOfADay),
      );
    }
  }

  @override
  Future<void> deleteAllStructuresOfADay(String structureId) async {
    final keys = _getKeys(kStructuresOfADayCollectionKey);

    for (final key in keys) {
      final structuresOfADayJson = _getValue(key);

      if (structuresOfADayJson != null) {
        final structuresOfADay = List<Map<dynamic, dynamic>>.from(
          json.decode(structuresOfADayJson) as List,
        )
            .map(
              (jsonMap) =>
                  StructureOfADay.fromJson(Map<String, dynamic>.from(jsonMap)),
            )
            .toList()
          ..removeWhere((s) => s.structureId == structureId);
        return _setValue(key, json.encode(structuresOfADay));
      }
    }
  }

  @override
  Future<void> saveStructure(Structure structure) {
    final structures = [..._structuresStreamController.value];
    final structureIndex = structures.indexWhere((s) => s.id == structure.id);
    if (structureIndex >= 0) {
      structures[structureIndex] = structure;
    } else {
      structures.add(structure);
    }

    _structuresStreamController.add(structures);
    return _setValue(kStructuresCollectionKey, json.encode(structures));
  }

  @override
  Future<void> deleteStructure(String id) async {
    final structures = [..._structuresStreamController.value];
    final structureIndex = structures.indexWhere((s) => s.id == id);
    if (structureIndex == -1) {
      throw StructureNotFoundException();
    } else {
      structures.removeAt(structureIndex);
      _structuresStreamController.add(structures);
      return _setValue(kStructuresCollectionKey, json.encode(structures));
    }
  }

  @override
  List<StructureStep> getSteps(String structureId) {
    final stepsJson = _getValue(kStepsCollectionKey + structureId);
    if (stepsJson != null) {
      final steps = List<Map<dynamic, dynamic>>.from(
        json.decode(stepsJson) as List,
      )
          .map(
            (jsonMap) =>
                StructureStep.fromJson(Map<String, dynamic>.from(jsonMap)),
          )
          .toList();
      return steps;
    } else {
      return const [];
    }
  }

  @override
  Future<void> saveSteps(List<StructureStep> steps, String structureId) async {
    await _setValue(kStepsCollectionKey + structureId, json.encode(steps));
  }

  @override
  Future<void> deleteAllSteps(String structureId) async {
    return _deleteValue(kStepsCollectionKey + structureId);
  }

  @override
  Future<void> close() async {
    await _structuresStreamController.close();
    await _structuresOfADayStreamController.close();
  }
}
