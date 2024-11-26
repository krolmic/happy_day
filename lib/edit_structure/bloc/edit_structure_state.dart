part of 'edit_structure_bloc.dart';

enum EditStructureStatus { initial, loading, success, failure }

enum StepsGenerationStatus { initial, loading, success, failure }

enum StructureDeletionStatus { initial, loading, success, failure }

extension EditStructureStatusX on EditStructureStatus {
  bool get isLoadingOrSuccess => [
        EditStructureStatus.loading,
        EditStructureStatus.success,
      ].contains(this);
  bool get isSuccess => this == EditStructureStatus.success;
  bool get isFailure => this == EditStructureStatus.failure;
}

extension StepsGenerationStatusX on StepsGenerationStatus {
  bool get isLoading => this == StepsGenerationStatus.loading;
  bool get isSuccess => this == StepsGenerationStatus.success;
  bool get isFailure => this == StepsGenerationStatus.failure;
}

extension StructureDeletionStatusX on StructureDeletionStatus {
  bool get isLoading => this == StructureDeletionStatus.loading;
  bool get isSuccess => this == StructureDeletionStatus.success;
  bool get isFailure => this == StructureDeletionStatus.failure;
}

@freezed
class EditStructureState with _$EditStructureState {
  const factory EditStructureState({
    required String structureId,
    @Default(EditStructureStatus.initial) EditStructureStatus editStatus,
    @Default(StepsGenerationStatus.initial)
    StepsGenerationStatus stepsGenerationStatus,
    @Default(StructureDeletionStatus.initial)
    StructureDeletionStatus deletionStatus,
    @Default('en') String languageCode,
    Structure? initialStructure,
    @Default('') String title,
    @Default('') String description,
    @Default([]) List<StructureStep> steps,
    @Default(Colors.deepPurple) Color color,
  }) = _EditStructureState;
}

extension EditStructureStateX on EditStructureState {
  bool get isNewStructure => initialStructure == null;
  bool get isTitleValid => title.isNotEmpty;
}
