import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'structure_of_a_day.freezed.dart';
part 'structure_of_a_day.g.dart';

/// A structure of a day is a structure started on a [date].
@freezed
class StructureOfADay with _$StructureOfADay {
  /// Creates a new [StructureOfADay].
  factory StructureOfADay({
    required String id,
    required String structureId,
    required DateTime date,
    required List<String> stepsIds,
    required List<String> completedStepsIds,
  }) = _StructureOfADay;

  StructureOfADay._();

  /// Creates a new [StructureOfADay] from a JSON object.
  factory StructureOfADay.fromJson(Map<String, Object?> json) =>
      _$StructureOfADayFromJson(json);

  /// Creates an empty [StructureOfADay].
  factory StructureOfADay.empty() => StructureOfADay(
        id: const Uuid().v4(),
        structureId: '',
        date: DateTime.now(),
        stepsIds: const [],
        completedStepsIds: const [],
      );

  /// Creates a new [StructureOfADay] that represents
  /// a non-existent structure of a day.
  factory StructureOfADay.none() => StructureOfADay(
        id: 'none',
        structureId: 'none',
        date: DateTime(1),
        stepsIds: const [],
        completedStepsIds: const [],
      );

  /// Whether the structure of a day is the non-existent one.
  bool get isNone => id == 'none';

  /// Whether the structure of a day is completed.
  bool get isCompleted => completedStepsIds.length >= stepsIds.length;
}
