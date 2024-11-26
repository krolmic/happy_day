import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'edit_structure_bloc.freezed.dart';
part 'edit_structure_event.dart';
part 'edit_structure_state.dart';

class EditStructureBloc extends Bloc<EditStructureEvent, EditStructureState> {
  EditStructureBloc({
    required StructuresRepository structuresRepository,
    required StepsGenerationRepository stepsGenerationRepository,
    required Structure? initialStructure,
    String? languageCode,
  })  : _structuresRepository = structuresRepository,
        _stepsGenerationRepository = stepsGenerationRepository,
        super(
          EditStructureState(
            structureId: initialStructure?.id ?? Structure.newId,
            initialStructure: initialStructure,
            title: initialStructure?.title ?? '',
            description: initialStructure?.description ?? '',
            color: initialStructure != null
                ? Color(initialStructure.color)
                : Colors.deepPurple,
            steps: initialStructure != null
                ? structuresRepository.getSteps(initialStructure.id)
                : [],
            languageCode: languageCode ?? 'en',
          ),
        ) {
    on<EditStructureEvent>((event, emit) async {
      if (event.isTitleChanged) {
        _onTitleChanged(event.title, emit);
      } else if (event.isDescriptionChanged) {
        _onDescriptionChanged(event.description, emit);
      } else if (event.isSubmitted) {
        await _onSubmitted(emit);
      } else if (event.isColorChanged) {
        _onColorChanged(event.color, emit);
      } else if (event.isNextStep) {
        await _onNextStep(emit);
      } else if (event.isStepChanged) {
        _onStepChanged(event.changedStepIndex, event.changedStepTitle, emit);
      } else if (event.isStepRemoved) {
        _onStepRemoved(event.removedStepIndex, emit);
      } else if (event.isStepAdded) {
        _onStepAdded(emit);
      } else if (event.isStepReordered) {
        _onStepReordered(
          event.reorderedOldIndex,
          event.reorderedNewIndex,
          emit,
        );
      } else if (event.isStructureDeleted) {
        await _onStructureDeleted(emit);
      }
    });
  }

  final StructuresRepository _structuresRepository;
  final StepsGenerationRepository _stepsGenerationRepository;

  void _onTitleChanged(
    String title,
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(state.copyWith(title: title));
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to change title',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  void _onDescriptionChanged(
    String description,
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(state.copyWith(description: description));
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to change description',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  void _onColorChanged(
    Color color,
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(state.copyWith(color: color));
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to change color',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  Future<void> _onSubmitted(
    Emitter<EditStructureState> emit,
  ) async {
    emit(state.copyWith(editStatus: EditStructureStatus.loading));

    final structure = (state.initialStructure ?? Structure.empty()).copyWith(
      id: state.structureId,
      title: state.title,
      description: state.description,
      stepsIds: state.steps.map((step) => step.id).toList(),
      color: state.color.value,
    );

    try {
      await _structuresRepository.saveStructure(structure, state.steps);

      emit(state.copyWith(editStatus: EditStructureStatus.success));
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to submit structure',
        ex: error,
        stacktrace: stackTrace,
      );

      emit(state.copyWith(editStatus: EditStructureStatus.failure));
    }
  }

  Future<void> _onStructureDeleted(Emitter<EditStructureState> emit) async {
    try {
      if (!state.isNewStructure) {
        emit(state.copyWith(deletionStatus: StructureDeletionStatus.loading));

        await _structuresRepository.deleteStructure(state.structureId);
        await _structuresRepository.deleteAllSteps(state.structureId);
        await _structuresRepository
            .deleteAllStructuresOfADay(state.structureId);

        emit(state.copyWith(deletionStatus: StructureDeletionStatus.success));
      }
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to delete structure',
        ex: error,
        stacktrace: stackTrace,
      );

      emit(state.copyWith(deletionStatus: StructureDeletionStatus.failure));
    }
  }

  Future<void> _onNextStep(Emitter<EditStructureState> emit) async {
    try {
      if (state.isNewStructure && state.steps.isEmpty) {
        emit(
          state.copyWith(stepsGenerationStatus: StepsGenerationStatus.loading),
        );

        final steps = await _stepsGenerationRepository.generateSteps(
          structureTitle: state.title,
          structureDescription: state.description,
          languageCode: state.languageCode,
        );

        emit(
          state.copyWith(
            stepsGenerationStatus: StepsGenerationStatus.success,
            steps: StructureStep.listFromTitles(
              structureId: state.structureId,
              titles: steps,
            ),
          ),
        );
      }
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to generate steps',
        ex: error,
        stacktrace: stackTrace,
      );

      emit(
        state.copyWith(stepsGenerationStatus: StepsGenerationStatus.failure),
      );
    }
  }

  void _onStepChanged(
    int index,
    String title,
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          steps: state.steps
              .asMap()
              .map(
                (currentIndex, step) => MapEntry(
                  currentIndex,
                  currentIndex == index ? step.copyWith(title: title) : step,
                ),
              )
              .values
              .toList(),
        ),
      );
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to change step',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  void _onStepRemoved(
    int index,
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          steps: List.from(state.steps)..removeAt(index),
        ),
      );
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to remove step',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  void _onStepAdded(
    Emitter<EditStructureState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          steps: List.from(state.steps)
            ..insert(state.steps.length, StructureStep.empty()),
        ),
      );
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to add step',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }

  void _onStepReordered(
    int oldIndex,
    int newIndex,
    Emitter<EditStructureState> emit,
  ) {
    try {
      final steps = List<StructureStep>.from(state.steps);
      final temp = steps[oldIndex];
      steps[oldIndex] = steps[newIndex];
      steps[newIndex] = temp;
      emit(state.copyWith(steps: steps));
    } catch (error, stackTrace) {
      Fimber.e(
        'Failed to reorder step',
        ex: error,
        stacktrace: stackTrace,
      );
    }
  }
}
