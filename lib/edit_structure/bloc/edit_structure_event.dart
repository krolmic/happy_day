part of 'edit_structure_bloc.dart';

@freezed
class EditStructureEvent with _$EditStructureEvent {
  const factory EditStructureEvent.submitted() = _Submitted;
  const factory EditStructureEvent.titleChanged(String title) = _TitleChanged;
  const factory EditStructureEvent.descriptionChanged(String description) =
      _DescriptionChanged;
  const factory EditStructureEvent.colorChanged(Color color) = _ColorChanged;
  const factory EditStructureEvent.nextStep() = _NextStep;
  const factory EditStructureEvent.stepChanged(int index, String title) =
      _StepChanged;
  const factory EditStructureEvent.stepRemoved(int index) = _StepRemoved;
  const factory EditStructureEvent.stepAdded() = _StepAdded;
  const factory EditStructureEvent.stepReordered(int oldIndex, int newIndex) =
      _StepReordered;
  const factory EditStructureEvent.structureDeleted() = _StructureDeleted;
}

extension EditStructureEventX on EditStructureEvent {
  bool get isSubmitted => this is _Submitted;
  bool get isTitleChanged => this is _TitleChanged;
  bool get isDescriptionChanged => this is _DescriptionChanged;
  bool get isColorChanged => this is _ColorChanged;
  bool get isNextStep => this is _NextStep;
  bool get isStepChanged => this is _StepChanged;
  bool get isStepRemoved => this is _StepRemoved;
  bool get isStepAdded => this is _StepAdded;
  bool get isStepReordered => this is _StepReordered;
  bool get isStructureDeleted => this is _StructureDeleted;

  String get title => (this as _TitleChanged).title;
  String get description => (this as _DescriptionChanged).description;
  Color get color => (this as _ColorChanged).color;
  int get changedStepIndex => (this as _StepChanged).index;
  String get changedStepTitle => (this as _StepChanged).title;
  int get removedStepIndex => (this as _StepRemoved).index;
  int get oldIndex => (this as _StepReordered).oldIndex;
  int get newIndex => (this as _StepReordered).newIndex;
}
