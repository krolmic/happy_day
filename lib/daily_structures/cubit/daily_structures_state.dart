part of 'daily_structures_cubit.dart';

enum DailyStructuresStatus { initial, loading, success, failure }

extension DailyStructuresStatusX on DailyStructuresStatus {
  bool get isInitialOrLoading =>
      this == DailyStructuresStatus.initial ||
      this == DailyStructuresStatus.loading;
  bool get isSuccess => this == DailyStructuresStatus.success;
  bool get isFailure => this == DailyStructuresStatus.failure;
}

enum StructuresOfADayStatus { initial, loading, success, failure }

extension StructuresOfADayStatusX on StructuresOfADayStatus {
  bool get isInitialOrLoading =>
      this == StructuresOfADayStatus.initial ||
      this == StructuresOfADayStatus.loading;
  bool get isSuccess => this == StructuresOfADayStatus.success;
  bool get isFailure => this == StructuresOfADayStatus.failure;
}

enum StartStructureStatus { initial, loading, success, failure }

extension StartStructureStatusX on StartStructureStatus {
  bool get isFailure => this == StartStructureStatus.failure;
}

@freezed
class DailyStructuresState with _$DailyStructuresState {
  const factory DailyStructuresState({
    required DateTime date,
    @Default(DailyStructuresStatus.initial)
    DailyStructuresStatus structuresStatus,
    @Default([]) List<Structure> structures,
    @Default(StructuresOfADayStatus.initial)
    StructuresOfADayStatus structuresOfADayStatus,
    @Default([]) List<StructureOfADay> structuresOfADay,
    @Default(StartStructureStatus.initial)
    StartStructureStatus startStructureStatus,
  }) = _DailyStructuresState;
}

extension DailyStructuresStateX on DailyStructuresState {
  bool get isInitialOrLoading =>
      structuresStatus.isInitialOrLoading ||
      structuresOfADayStatus.isInitialOrLoading;
  bool get isSuccess =>
      structuresStatus.isSuccess && structuresOfADayStatus.isSuccess;
  bool get isFailure =>
      structuresStatus.isFailure || structuresOfADayStatus.isFailure;

  bool isStructureStarted(Structure structure) {
    final structureOfADay = getStructureOfADay(structure);
    return structureOfADay != null;
  }

  StructureOfADay? getStructureOfADay(Structure structure) {
    final structureOfADay = structuresOfADay.firstWhere(
      (s) => s.structureId == structure.id && s.date.isSameDay(date),
      orElse: StructureOfADay.none,
    );

    if (structureOfADay.isNone) {
      return null;
    }

    return structureOfADay;
  }
}
