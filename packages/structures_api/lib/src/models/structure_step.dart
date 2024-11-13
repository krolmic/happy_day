import 'package:freezed_annotation/freezed_annotation.dart';

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

  /// Creates a new [StructureStep] from a JSON object.
  factory StructureStep.fromJson(Map<String, Object?> json) =>
      _$StructureStepFromJson(json);
}
