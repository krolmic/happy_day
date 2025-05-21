import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_structures_api/local_storage_structures_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structures_api/structures_api.dart';

void main() {
  group('LocalStorageStructuresApi', () {
    late SharedPreferences plugin;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      plugin = await SharedPreferences.getInstance();
    });

    test('deleteAllStructuresOfADay removes structures from all days', () async {
      final date1 = DateTime(2024, 1, 1);
      final date2 = DateTime(2024, 1, 2);
      const structureId = 'structure_1';

      final structure1 = StructureOfADay(
        id: '1',
        structureId: structureId,
        date: date1,
        stepsIds: const [],
        completedStepsIds: const [],
      );
      final structure2 = StructureOfADay(
        id: '2',
        structureId: structureId,
        date: date2,
        stepsIds: const [],
        completedStepsIds: const [],
      );

      SharedPreferences.setMockInitialValues({
        '${LocalStorageStructuresApi.kStructuresOfADayCollectionKey}${date1.toIso8601String()}':
            json.encode([structure1.toJson()]),
        '${LocalStorageStructuresApi.kStructuresOfADayCollectionKey}${date2.toIso8601String()}':
            json.encode([structure2.toJson()]),
      });
      plugin = await SharedPreferences.getInstance();

      final api = LocalStorageStructuresApi(plugin: plugin);

      await api.deleteAllStructuresOfADay(structureId);

      final remaining1 = plugin.getString(
        '${LocalStorageStructuresApi.kStructuresOfADayCollectionKey}${date1.toIso8601String()}',
      );
      final remaining2 = plugin.getString(
        '${LocalStorageStructuresApi.kStructuresOfADayCollectionKey}${date2.toIso8601String()}',
      );

      expect(json.decode(remaining1!), isEmpty);
      expect(json.decode(remaining2!), isEmpty);
    });
  });
}
