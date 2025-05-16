// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_day_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarDayStructureImpl _$$CalendarDayStructureImplFromJson(
        Map<String, dynamic> json) =>
    _$CalendarDayStructureImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      stepsIds: (json['stepsIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      colorRed: (json['colorRed'] as num?)?.toInt() ?? 103,
      colorGreen: (json['colorGreen'] as num?)?.toInt() ?? 58,
      colorBlue: (json['colorBlue'] as num?)?.toInt() ?? 183,
      calendarDay: DateTime.parse(json['calendarDay'] as String),
    );

Map<String, dynamic> _$$CalendarDayStructureImplToJson(
        _$CalendarDayStructureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'stepsIds': instance.stepsIds,
      'description': instance.description,
      'colorRed': instance.colorRed,
      'colorGreen': instance.colorGreen,
      'colorBlue': instance.colorBlue,
      'calendarDay': instance.calendarDay.toIso8601String(),
    };
