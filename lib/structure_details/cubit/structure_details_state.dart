part of 'structure_details_cubit.dart';

enum StartStructureStatus { initial, loading, success, failure }

extension StartStructureStatusX on StartStructureStatus {
  bool get isFailure => this == StartStructureStatus.failure;
}

enum StepCompletionStatus { initial, loading, success, failure }

extension StepCompletionStatusX on StepCompletionStatus {
  bool get isFailure => this == StepCompletionStatus.failure;
}

@freezed
class StructureDetailsState with _$StructureDetailsState {
  factory StructureDetailsState({
    required Structure structure,
    required DateTime date,
    StructureOfADay? structureOfADay,
    @Default(StartStructureStatus.initial)
    StartStructureStatus startStructureStatus,
    @Default(StepCompletionStatus.initial)
    StepCompletionStatus stepCompletionStatus,
  }) = _StructureDetailsState;
}

extension StructureDetailsStateX on StructureDetailsState {
  bool get isStructureStarted =>
      structureOfADay != null && structure.id == structureOfADay!.structureId;
}
