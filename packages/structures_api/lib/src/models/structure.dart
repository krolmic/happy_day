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
    @Default(0xff3f51b5) int color,
  }) = _Structure;

  const Structure._();

  /// Creates an empty [Structure].
  factory Structure.empty() => Structure(title: '', id: const Uuid().v4());

  /// Creates a new [Structure] from a JSON object.
  factory Structure.fromJson(Map<String, Object?> json) =>
      _$StructureFromJson(json);

  /// Whether the structure has a description.
  bool get hasDescription => description != null && description!.isNotEmpty;
}