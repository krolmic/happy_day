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
    @Default(0) int activeStepIndex,
    @Default(StartStructureStatus.initial)
    StartStructureStatus startStructureStatus,
    @Default(StepCompletionStatus.initial)
    StepCompletionStatus stepCompletionStatus,
    @Default([]) List<StructureStep> steps,
  }) = _StructureDetailsState;
}

extension StructureDetailsStateX on StructureDetailsState {
  bool get isStructureStarted =>
      structureOfADay != null && structure.id == structureOfADay!.structureId;

  bool isStepCompleted(String stepId) =>
      structureOfADay?.completedStepsIds.contains(stepId) ?? false;

  bool get isCurrentStepCompleted => isStepCompleted(steps[activeStepIndex].id);

  bool get isFirstStep => activeStepIndex == 0;
  bool get isLastStep => activeStepIndex == steps.length - 1;
}
