part of 'edit_structure_bloc.dart';

@freezed
class EditStructureEvent with _$EditStructureEvent {
  const factory EditStructureEvent.submitted() = _Submitted;
  const factory EditStructureEvent.titleChanged(String title) = _TitleChanged;
  const factory EditStructureEvent.descriptionChanged(String description) =
      _DescriptionChanged;
  const factory EditStructureEvent.colorChanged(Color color) = _ColorChanged;
  const factory EditStructureEvent.nextStep() = _NextStep;
}

extension EditStructureEventX on EditStructureEvent {
  bool get isSubmitted => this is _Submitted;
  bool get isTitleChanged => this is _TitleChanged;
  bool get isDescriptionChanged => this is _DescriptionChanged;
  bool get isColorChanged => this is _ColorChanged;
  bool get isNextStep => this is _NextStep;

  String get title => (this as _TitleChanged).title;
  String get description => (this as _DescriptionChanged).description;
  Color get color => (this as _ColorChanged).color;
}
