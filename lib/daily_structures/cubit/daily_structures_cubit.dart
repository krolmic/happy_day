import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:happy_day/shared/extensions/datetime.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'daily_structures_cubit.freezed.dart';
part 'daily_structures_state.dart';

class DailyStructuresCubit extends Cubit<DailyStructuresState> {
  DailyStructuresCubit({
    required StructuresRepository structuresRepository,
  })  : _structuresRepository = structuresRepository,
        super(DailyStructuresState(date: DateTime.now()));

  final StructuresRepository _structuresRepository;

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
        log('Error fetching structures', error: error, stackTrace: stackTrace);

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
        log(
          'Error fetching structures of a day',
          error: error,
          stackTrace: stackTrace,
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
      log(
        'Error loading structures of a day',
        error: e,
        stackTrace: stackTrace,
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
      log(
        'Error loading structures of a day',
        error: e,
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(
          structuresOfADayStatus: StructuresOfADayStatus.failure,
        ),
      );
    }
  }

  Future<void> startStructure(Structure structure) async {
    try {
      final structureStarted = state.isStructureStarted(structure);

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
      log(
        'Error starting structure',
        error: e,
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(
          startStructureStatus: StartStructureStatus.failure,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _structuresStream?.cancel();
    _structuresOfADayStream?.cancel();
    return super.close();
  }
}
