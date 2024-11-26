import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
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

  void init() {
    final steps = _structuresRepository.getSteps(state.structure.id);
    emit(state.copyWith(steps: steps));
  }

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
            activeStepIndex: 0,
            startStructureStatus: StartStructureStatus.success,
            structureOfADay: null,
          ),
        );
      }
    } catch (e, stackTrace) {
      Fimber.e(
        'Failed to reset structure',
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

  void setActiveStepIndex(int index) {
    if (index >= 0 && index < state.steps.length) {
      emit(state.copyWith(activeStepIndex: index));
    }
  }

  Future<void> completeStep(String stepId) async {
    if (!state.isStructureStarted) {
      await startStructure();
    }
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
      Fimber.e(
        'Failed to save structure of a day step',
        ex: e,
        stacktrace: stackTrace,
      );

      emit(
        state.copyWith(
          stepCompletionStatus: StepCompletionStatus.failure,
        ),
      );
    }
  }
}
