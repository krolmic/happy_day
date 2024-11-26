part of '../structure_details_page.dart';

class Steps extends StatelessWidget {
  const Steps({
    required this.color,
    super.key,
  });

  final Color color;

  void onCompleteStep(BuildContext context, String stepId) {
    context.read<StructureDetailsCubit>().completeStep(stepId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return BlocBuilder<StructureDetailsCubit, StructureDetailsState>(
      buildWhen: (previous, current) =>
          previous.steps != current.steps ||
          previous.structureOfADay != current.structureOfADay ||
          previous.activeStepIndex != current.activeStepIndex,
      builder: (context, state) {
        return Stepper(
          connectorColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return color;
              }
              return color.withOpacity(0.3);
            },
          ),
          currentStep: state.activeStepIndex,
          onStepCancel: () {
            context
                .read<StructureDetailsCubit>()
                .setActiveStepIndex(state.activeStepIndex - 1);
          },
          onStepContinue: () {
            context
                .read<StructureDetailsCubit>()
                .setActiveStepIndex(state.activeStepIndex + 1);
          },
          onStepTapped: (index) {
            context.read<StructureDetailsCubit>().setActiveStepIndex(index);
          },
          stepIconHeight: 40,
          stepIconWidth: 40,
          controlsBuilder: (context, details) {
            final isCompleted = state.isCurrentStepCompleted;

            final isUndoButtonEnabled =
                state.activeStepIndex > 0 || isCompleted;

            final isCompleteButtonEnabled = !(state.isLastStep && isCompleted);

            return Row(
              children: [
                MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: isCompleteButtonEnabled
                      ? () async {
                          if (!isCompleted) {
                            onCompleteStep(
                              context,
                              state.steps[state.activeStepIndex].id,
                            );
                          }

                          details.onStepContinue!();
                        }
                      : null,
                  child: Row(
                    children: [
                      const Icon(Icons.check),
                      const SizedBox(width: 10),
                      Text(l10n.complete),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: theme.colorScheme.surface,
                  onPressed: isUndoButtonEnabled
                      ? () {
                          if (isCompleted) {
                            context
                                .read<StructureDetailsCubit>()
                                .undoStepCompletion(
                                  state.steps[state.activeStepIndex].id,
                                );
                          }

                          details.onStepCancel!();
                        }
                      : null,
                  child: Row(
                    children: [
                      const Icon(Icons.undo),
                      const SizedBox(width: 10),
                      Text(l10n.undo),
                    ],
                  ),
                ),
              ],
            );
          },
          steps: state.steps.map(
            (step) {
              final isCompleted = state.isStepCompleted(step.id);
              final isActive =
                  state.activeStepIndex == state.steps.indexOf(step);

              return Step(
                state: isCompleted ? StepState.complete : StepState.indexed,
                isActive: isActive,
                content: const SizedBox.shrink(),
                title: Text(step.title),
                stepStyle: StepStyle(
                  indexStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: isActive ? color : color.withOpacity(0.3),
                  ),
                  border: Border.all(
                    color: isActive ? color : color.withOpacity(0.3),
                  ),
                  color: isCompleted
                      ? color
                      : isActive
                          ? color.withOpacity(0.1)
                          : theme.colorScheme.surface,
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
