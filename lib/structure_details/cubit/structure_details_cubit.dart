import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'structure_details_cubit.freezed.dart';
part 'structure_details_state.dart';

class StructureDetailsCubit extends Cubit<StructureDetailsState> {
  StructureDetailsCubit({
    required StructuresRepository structuresRepository,
    required Structure structure,
    required DateTime date,
    StructureOfADay? structureOfADay,
  })  : _structuresRepository = structuresRepository,
        super(
          StructureDetailsState(
            structure: structure,
            date: date,
            structureOfADay: structureOfADay,
          ),
        );

  final StructuresRepository _structuresRepository;

  Future<void> startStructure() async {
    try {
      if (!state.isStructureStarted) {
        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.loading,
          ),
        );

        final structureOfADay = StructureOfADay.empty().copyWith(
          structureId: state.structure.id,
          date: state.date,
          stepsIds: state.structure.stepsIds,
          completedStepsIds: const [],
        );

        await _structuresRepository.saveStructureOfADay(structureOfADay);

        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.success,
            structureOfADay: structureOfADay,
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

  Future<void> resetStructure() async {
    try {
      if (state.isStructureStarted) {
        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.loading,
          ),
        );

        await _structuresRepository.deleteStructureOfADay(
          state.structureOfADay!.id,
        );

        emit(
          state.copyWith(
            startStructureStatus: StartStructureStatus.success,
            structureOfADay: null,
          ),
        );
      }
    } catch (e, stackTrace) {
      log(
        'Error resetting structure',
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

  Future<void> completeStep(String stepId) async {
    await _saveStructureOfADayStep(stepId: stepId, isCompleted: true);
  }

  Future<void> undoStepCompletion(String stepId) async {
    await _saveStructureOfADayStep(stepId: stepId, isCompleted: false);
  }

  Future<void> _saveStructureOfADayStep({
    required String stepId,
    required bool isCompleted,
  }) async {
    try {
      if (state.isStructureStarted) {
        emit(
          state.copyWith(
            stepCompletionStatus: StepCompletionStatus.loading,
          ),
        );

        final stepsIds =
            List<String>.from(state.structureOfADay!.completedStepsIds);

        if (isCompleted && !stepsIds.contains(stepId)) {
          stepsIds.add(stepId);
        } else if (!isCompleted && stepsIds.contains(stepId)) {
          stepsIds.remove(stepId);
        }

        final structureOfADay =
            state.structureOfADay!.copyWith(completedStepsIds: stepsIds);
        await _structuresRepository.saveStructureOfADay(
          structureOfADay,
        );

        emit(
          state.copyWith(
            stepCompletionStatus: StepCompletionStatus.success,
            structureOfADay: structureOfADay,
          ),
        );
      }
    } catch (e, stackTrace) {
      log(
        'Error saving structure of a day step',
        error: e,
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(
          stepCompletionStatus: StepCompletionStatus.failure,
        ),
      );
    }
  }
}
