import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'structure_step.freezed.dart';
part 'structure_step.g.dart';

/// A step is a single task in a structure with [structureId].
@freezed
class StructureStep with _$StructureStep {
  /// Creates a new [StructureStep].
  factory StructureStep({
    required String id,
    required String structureId,
    required String title,
  }) = _StructureStep;

  StructureStep._();

  /// Creates an empty [StructureStep].
  factory StructureStep.empty() => StructureStep(
        id: newId,
        structureId: '',
        title: '',
      );

  /// Creates a new [StructureStep] from a JSON object.
  factory StructureStep.fromJson(Map<String, Object?> json) =>
      _$StructureStepFromJson(json);

  /// Creates a list of [StructureStep] from a list of titles.
  static List<StructureStep> listFromTitles({
    required String structureId,
    required List<String> titles,
  }) =>
      titles
          .map(
            (title) => StructureStep(
              id: const Uuid().v4(),
              structureId: structureId,
              title: title,
            ),
          )
          .toList();

  /// Returns an ID for a new [StructureStep].
  static String get newId => const Uuid().v4();
}
