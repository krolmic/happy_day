import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'daily_structures_cubit.freezed.dart';
part 'daily_structures_state.dart';

class DailyStructuresCubit extends Cubit<DailyStructuresState> {
  DailyStructuresCubit({
    required StructuresRepository structuresRepository,
    required StructureAvailabilityService structureAvailabilityService,
  })  : _structuresRepository = structuresRepository,
        _availabilityService = structureAvailabilityService,
        super(DailyStructuresState(date: DateTime.now()));

  final StructuresRepository _structuresRepository;
  final StructureAvailabilityService _availabilityService;

  late final StreamSubscription<List<Structure>>? _structuresStream;
  late final StreamSubscription<List<StructureOfADay>>? _structuresOfADayStream;

  void init() {
    emit(
      state.copyWith(
        structuresStatus: DailyStructuresStatus.loading,
        structuresOfADayStatus: StructuresOfADayStatus.loading,
      ),
    );

    _initStructures();
    _initStructuresOfADay();
  }

  void _initStructures() {
    _structuresStream = _structuresRepository.getStructures().listen(
      (structures) => emit(
        state.copyWith(
          structuresStatus: DailyStructuresStatus.success,
          structures: structures,
        ),
      ),
      onError: (Object error, StackTrace stackTrace) {
        Fimber.e(
          'Failed to init structures',
          ex: error,
          stacktrace: stackTrace,
        );

        emit(
          state.copyWith(
            structuresStatus: DailyStructuresStatus.failure,
          ),
        );
      },
    );
  }

  void _initStructuresOfADay() {
    _structuresOfADayStream =
        _structuresRepository.getStructuresOfADay().listen(
      (structuresOfADay) => emit(
        state.copyWith(
          structuresOfADayStatus: StructuresOfADayStatus.success,
          structuresOfADay: structuresOfADay,
        ),
      ),
      onError: (Object error, StackTrace stackTrace) {
        Fimber.e(
          'Failed in structures of a day stream',
          ex: error,
          stacktrace: stackTrace,
        );

        emit(
          state.copyWith(
            structuresOfADayStatus: StructuresOfADayStatus.failure,
          ),
        );
      },
    );

    try {
      _structuresRepository.loadStructuresOfADay(state.date);
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to load structures of a day',
        ex: e,
        stacktrace: stackTrace,
      );

      emit(
        state.copyWith(
          structuresOfADayStatus: StructuresOfADayStatus.failure,
        ),
      );
    }
  }

  Future<void> setDate(DateTime date) async {
    try {
      emit(
        state.copyWith(
          date: date,
          structuresOfADayStatus: StructuresOfADayStatus.loading,
        ),
      );

      _structuresRepository.loadStructuresOfADay(date);
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to set date',
        ex: e,
        stacktrace: stackTrace,
      );

      emit(
        state.copyWith(
          structuresOfADayStatus: StructuresOfADayStatus.failure,
        ),
      );
    }
  }

  void setStructuresToDisplaySetting(StructuresToDisplaySetting setting) {
    emit(
      state.copyWith(
        structuresToDisplaySetting: setting,
      ),
    );
  }

  Future<void> startStructure(Structure structure) async {
    try {
      final structureStarted = _availabilityService.isStructureStarted(
        structure,
        state.date,
        state.structuresOfADay,
      );

      if (!structureStarted) {
        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.loading,
          ),
        );

        final structureOfADay = StructureOfADay.empty().copyWith(
          structureId: structure.id,
          date: state.date,
          stepsIds: structure.stepsIds,
          completedStepsIds: const [],
        );

        await _structuresRepository.saveStructureOfADay(structureOfADay);

        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.success,
          ),
        );
      }
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to start structure',
        ex: e,
        stacktrace: stackTrace,
      );

      emit(
        state.copyWith(
          startStructureStatus: StartStructureStatus.failure,
        ),
      );
    }
  }

  bool isStructureStarted(Structure structure) {
    return _availabilityService.isStructureStarted(
      structure,
      state.date,
      state.structuresOfADay,
    );
  }

  StructureOfADay? getStructureOfADay(Structure structure) {
    return _availabilityService.getStructureOfADay(
      structure,
      state.date,
      state.structuresOfADay,
    );
  }

  bool canStructureOnlyBeEdited(Structure structure) {
    return _availabilityService.canStructureOnlyBeEdited(
      structure,
      state.date,
      state.structuresOfADay,
    );
  }

  List<Structure> getSortedStructures() {
    return _availabilityService.getSortedStructures(
      structures: state.structures,
      date: state.date,
      structuresOfDay: state.structuresOfADay,
      returnAllStructures:
          state.structuresToDisplaySetting == StructuresToDisplaySetting.all,
    );
  }

  List<Structure> getActiveStructures(List<Structure> structures) {
    return structures.where((s) => !canStructureOnlyBeEdited(s)).toList();
  }

  List<Structure> getOnlyEditableStructures(List<Structure> structures) {
    return structures.where(canStructureOnlyBeEdited).toList();
  }

  @override
  Future<void> close() {
    _structuresStream?.cancel();
    _structuresOfADayStream?.cancel();
    return super.close();
  }
}
