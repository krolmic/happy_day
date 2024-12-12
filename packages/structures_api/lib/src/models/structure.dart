import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'structure.freezed.dart';
part 'structure.g.dart';

/// A structure consists of [title], [description], and a [stepsIds] collection.
@freezed
class Structure with _$Structure {
  /// Creates a new [Structure].
  factory Structure({
    required String id,
    required String title,
    @Default([]) List<String> stepsIds,
    String? description,
    @Default(103) int colorRed,
    @Default(58) int colorGreen,
    @Default(183) int colorBlue,
  }) = _Structure;

  const Structure._();

  /// Creates an empty [Structure].
  factory Structure.empty() => Structure(title: '', id: newId);

  /// Creates a new [Structure] from a JSON object.
  factory Structure.fromJson(Map<String, Object?> json) =>
      _$StructureFromJson(json);

  /// Creates a new ID for a [Structure].
  static String get newId => const Uuid().v4();

  /// Whether the structure has a description.
  bool get hasDescription => description != null && description!.isNotEmpty;
}
