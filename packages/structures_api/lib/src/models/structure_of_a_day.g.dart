// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_of_a_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructureOfADayImpl _$$StructureOfADayImplFromJson(
        Map<String, dynamic> json) =>
    _$StructureOfADayImpl(
      id: json['id'] as String,
      structureId: json['structureId'] as String,
      date: DateTime.parse(json['date'] as String),
      stepsIds:
          (json['stepsIds'] as List<dynamic>).map((e) => e as String).toList(),
      completedStepsIds: (json['completedStepsIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$StructureOfADayImplToJson(
        _$StructureOfADayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'structureId': instance.structureId,
      'date': instance.date.toIso8601String(),
      'stepsIds': instance.stepsIds,
      'completedStepsIds': instance.completedStepsIds,
    };
