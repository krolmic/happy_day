import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'edit_structure_bloc.freezed.dart';
part 'edit_structure_event.dart';
part 'edit_structure_state.dart';

class EditStructureBloc extends Bloc<EditStructureEvent, EditStructureState> {
  EditStructureBloc({
    required StructuresRepository structuresRepository,
    required Structure? initialStructure,
  })  : _structuresRepository = structuresRepository,
        super(
          EditStructureState(
            initialStructure: initialStructure,
            title: initialStructure?.title ?? '',
            description: initialStructure?.description ?? '',
            color: initialStructure != null
                ? Color(initialStructure.color)
                : Colors.orange,
            steps: initialStructure != null
                ? structuresRepository.getSteps(initialStructure.id)
                : [],
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
      }
    });
  }

  final StructuresRepository _structuresRepository;

  void _onTitleChanged(
    String title,
    Emitter<EditStructureState> emit,
  ) {
    emit(state.copyWith(title: title));
  }

  void _onDescriptionChanged(
    String description,
    Emitter<EditStructureState> emit,
  ) {
    emit(state.copyWith(description: description));
  }

  void _onColorChanged(
    Color color,
    Emitter<EditStructureState> emit,
  ) {
    emit(state.copyWith(color: color));
  }

  Future<void> _onSubmitted(
    Emitter<EditStructureState> emit,
  ) async {
    emit(state.copyWith(status: EditStructureStatus.loading));

    final structure = (state.initialStructure ?? Structure.empty()).copyWith(
      title: state.title,
      description: state.description,
      stepsIds: state.steps.map((step) => step.id).toList(),
      color: state.color.value,
    );

    try {
      await _structuresRepository.saveStructure(structure, state.steps);

      emit(state.copyWith(status: EditStructureStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStructureStatus.failure));
    }
  }

  Future<void> _onNextStep(Emitter<EditStructureState> emit) async {
    // TODO(krolmic): verify if steps are already set
    if (state.isNewStructure) {
      emit(
        state.copyWith(stepsGenerationStatus: StepsGenerationStatus.loading),
      );

      // TODO(krolmic): generate steps by Gemini / Vertex, set steps
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(seconds: 3));

      emit(
        state.copyWith(stepsGenerationStatus: StepsGenerationStatus.success),
      );
    }
  }
}
