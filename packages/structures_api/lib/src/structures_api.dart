import 'package:structures_api/structures_api.dart';

/// {@template structures_api}
/// The interface for an API that provides access to a list of structures.
/// {@endtemplate}
abstract class StructuresApi {
  /// {@macro structures_api}
  const StructuresApi();

  /// Provides a [Stream] of all structures.
  Stream<List<Structure>> getStructures();

  /// Saves a [structure].
  ///
  /// If a [structure] with the same id already exists, it will be replaced.
  Future<void> saveStructure(Structure structure);

  /// Deletes the `structure` with the given id.
  ///
  /// If no `structure` with the given id exists, a [StructureNotFoundException]
  /// error is thrown.
  Future<void> deleteStructure(String id);

  /// Returns list of steps assigned to a given [structureId].
  List<StructureStep> getSteps(String structureId);

  /// Saves a list of [steps].
  ///
  /// If a step with the same id as any of the [steps] already exists, it
  /// will be replaced.
  Future<void> saveSteps(List<StructureStep> steps, String structureId);

  /// Deletes all steps assigned to a [Structure] with the given [structureId].
  Future<void> deleteAllSteps(String structureId);

  /// Loads structures of a [day]
  /// so they're available in the stream provided by [getStructuresOfADay].
  void loadStructuresOfADay(DateTime day);

  /// Provides a [Stream] of structures of a day.
  Stream<List<StructureOfADay>> getStructuresOfADay();

  /// Saves a [structureOfADay].
  ///
  /// If a [structureOfADay] with the same id already exists,
  /// it will be replaced.
  Future<void> saveStructureOfADay(StructureOfADay structureOfADay);

  /// Deletes a structure of a day with the given [id].
  Future<void> deleteStructureOfADay(String id);

  /// Deletes all structures of a day
  /// assigned to a [Structure] with the given id.
  Future<void> deleteAllStructuresOfADay(String structureId);

  /// Closes the client and frees up any resources.
  Future<void> close();
}

/// Error thrown when a [Structure] with a given id is not found.
class StructureNotFoundException implements Exception {}

/// Error thrown when a [StructureStep] with a given id is not found.
class StepNotFoundException implements Exception {}

/// Error thrown when a [StructureOfADay] with a given id is not found.
class StructureOfADayNotFoundException implements Exception {}
