import 'package:structures_api/structures_api.dart';

/// {@template structures_repository}
/// A repository that handles structure related requests.
/// {@endtemplate}
class StructuresRepository {
  /// {@macro structures_repository}
  const StructuresRepository({
    required StructuresApi structuresApi,
  }) : _structuresApi = structuresApi;

  final StructuresApi _structuresApi;

  /// Returns list of steps assigned to a structure with given [structureId].
  List<StructureStep> getSteps(String structureId) =>
      _structuresApi.getSteps(structureId);

  /// Deletes all steps assigned to a [Structure] with the given [structureId].
  Future<void> deleteAllSteps(String structureId) =>
      _structuresApi.deleteAllSteps(structureId);

  /// Provides a [Stream] of structures.
  Stream<List<Structure>> getStructures() => _structuresApi.getStructures();

  /// Saves a [structure] and its [steps].
  Future<void> saveStructure(
    Structure structure,
    List<StructureStep> steps,
  ) async {
    await Future.wait([
      _structuresApi.saveSteps(steps, structure.id),
      _structuresApi.saveStructure(structure),
    ]);
  }

  /// Deletes a structure by its [id].
  Future<void> deleteStructure(String id) => _structuresApi.deleteStructure(id);

  /// Loads structures of a day so they're available in the stream provided by
  /// [getStructuresOfADay].
  void loadStructuresOfADay(DateTime day) =>
      _structuresApi.loadStructuresOfADay(day);

  /// Provides a [Stream] of structures of a day.
  Stream<List<StructureOfADay>> getStructuresOfADay() =>
      _structuresApi.getStructuresOfADay();

  /// Saves a [structureOfADay].
  Future<void> saveStructureOfADay(StructureOfADay structureOfADay) =>
      _structuresApi.saveStructureOfADay(structureOfADay);

  /// Deletes a structure of a day with the given [id].
  Future<void> deleteStructureOfADay(String id) =>
      _structuresApi.deleteStructureOfADay(id);

  /// Deletes all structures of a day assigned to a [Structure] with the given
  /// [structureId].
  Future<void> deleteAllStructuresOfADay(String structureId) =>
      _structuresApi.deleteAllStructuresOfADay(structureId);
}
