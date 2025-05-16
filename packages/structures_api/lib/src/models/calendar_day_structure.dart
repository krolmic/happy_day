import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'calendar_day_structure.freezed.dart';
part 'calendar_day_structure.g.dart';

/// A structure assigned to a specific calendar day.
@freezed
class CalendarDayStructure with _$CalendarDayStructure {
  /// Creates a new [CalendarDayStructure].
  factory CalendarDayStructure({
    required String id,
    required String title,
    required DateTime calendarDay,
    @Default([]) List<String> stepsIds,
    String? description,
    @Default(103) int colorRed,
    @Default(58) int colorGreen,
    @Default(183) int colorBlue,
  }) = _CalendarDayStructure;

  const CalendarDayStructure._();

  /// Creates an empty [CalendarDayStructure].
  factory CalendarDayStructure.empty() => CalendarDayStructure(
        title: '',
        id: newId,
        calendarDay: DateTime.now(),
      );

  /// Creates a new [CalendarDayStructure] from a JSON object.
  factory CalendarDayStructure.fromJson(Map<String, Object?> json) =>
      _$CalendarDayStructureFromJson(json);

  /// Creates a new ID for a [CalendarDayStructure].
  static String get newId => const Uuid().v4();

  /// Whether the structure has a description.
  bool get hasDescription => description != null && description!.isNotEmpty;

  /// Total number of steps assigned to the structure.
  int get totalStepsCount => stepsIds.length;
}
