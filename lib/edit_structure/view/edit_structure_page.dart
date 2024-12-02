import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:happy_day/edit_structure/edit_structure.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/loading_indicator.dart';
import 'package:happy_day/shared/widgets/steps_indicator.dart';
import 'package:reorderables/reorderables.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:toastification/toastification.dart';

part 'widgets/color_selection.dart';
part 'widgets/description_field.dart';
part 'widgets/label.dart';
part 'widgets/preview.dart';
part 'widgets/steps.dart';
part 'widgets/structure_wizard.dart';
part 'widgets/title_field.dart';

class EditStructurePage extends StatelessWidget {
  const EditStructurePage({required this.initialStructure, super.key});

  final Structure? initialStructure;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditStructureBloc(
        structuresRepository: context.read<StructuresRepository>(),
        stepsGenerationRepository: context.read<StepsGenerationRepository>(),
        initialStructure: initialStructure,
        languageCode: context.languageCode,
      ),
      child: const EditStructureView(),
    );
  }
}

class EditStructureView extends StatelessWidget {
  const EditStructureView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<EditStructureBloc>();
    final isNewStructure = context.select(
      (EditStructureBloc bloc) => bloc.state.isNewStructure,
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<EditStructureBloc, EditStructureState>(
          listenWhen: (previous, current) =>
              previous.stepsGenerationStatus != current.stepsGenerationStatus,
          listener: (context, state) {
            if (state.stepsGenerationStatus.isSuccess) {
              toastification.dismissAll();
              showSuccessToastification(
                title: l10n.editStructureStepsGenerationSuccessMessage,
              );
            } else if (state.stepsGenerationStatus.isLoading) {
              showInfoToastification(
                title: l10n.editStructureStepsGenerationLoadingMessage,
                autoCloseDuration: null,
              );
            } else if (state.stepsGenerationStatus.isFailure) {
              toastification.dismissAll();
              showErrorToastification(
                title: l10n.editStructureStepsGenerationFailureMessage,
              );
            }
          },
        ),
        BlocListener<EditStructureBloc, EditStructureState>(
          listenWhen: (previous, current) =>
              previous.editStatus != current.editStatus,
          listener: (context, state) {
            if (state.editStatus.isSuccess) {
              showSuccessToastification(
                title: isNewStructure
                    ? l10n.editStructureAddSuccessMessage
                    : l10n.editStructureUpdateSuccessMessage,
              );

              context.goNamed(RoutesNames.dailyStructures);
            } else if (state.editStatus.isFailure) {
              showErrorToastification(
                title: l10n.errorMessage,
              );
            }
          },
        ),
        BlocListener<EditStructureBloc, EditStructureState>(
          listenWhen: (previous, current) =>
              previous.deletionStatus != current.deletionStatus,
          listener: (context, state) {
            if (state.deletionStatus.isSuccess) {
              showSuccessToastification(
                title: l10n.structureDeletionSuccessMessage,
              );

              context.goNamed(RoutesNames.dailyStructures);
            } else if (state.deletionStatus.isFailure) {
              showErrorToastification(
                title: l10n.errorMessage,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: buildAppBar(),
        body: SafeArea(
          child: StructureWizard(
            pages: [
              StructureWizardPage(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: BlocBuilder<EditStructureBloc, EditStructureState>(
                        buildWhen: (previous, current) =>
                            previous.color != current.color,
                        builder: (context, state) {
                          return TitleField(color: state.color);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<EditStructureBloc, EditStructureState>(
                      buildWhen: (previous, current) =>
                          previous.color != current.color,
                      builder: (context, state) {
                        return DescriptionField(color: state.color);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: Preview(),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ColorSelection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              StructureWizardPage(
                floatingActionButton:
                    BlocBuilder<EditStructureBloc, EditStructureState>(
                  buildWhen: (previous, current) =>
                      previous.stepsGenerationStatus !=
                          current.stepsGenerationStatus ||
                      previous.color != current.color,
                  builder: (context, state) {
                    final isEnabled = !state.stepsGenerationStatus.isLoading;
                    final color =
                        isEnabled ? state.color : state.color.withOpacity(0.3);

                    return FloatingActionButton(
                      backgroundColor: color,
                      elevation: 0,
                      onPressed: isEnabled
                          ? () => bloc.add(const EditStructureEvent.stepAdded())
                          : null,
                      child: const Icon(Icons.add),
                    );
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: BlocBuilder<EditStructureBloc, EditStructureState>(
                    buildWhen: (previous, current) =>
                        previous.color != current.color,
                    builder: (context, state) {
                      return Steps(stepsColor: state.color);
                    },
                  ),
                ),
              ),
            ],
            onCompleted: () {
              bloc.add(const EditStructureEvent.submitted());
            },
            onNextStep: () {
              bloc.add(const EditStructureEvent.nextStep());
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: BlocBuilder<EditStructureBloc, EditStructureState>(
        buildWhen: (previous, current) =>
            previous.initialStructure != current.initialStructure,
        builder: (context, state) {
          return Text(
            state.isNewStructure
                ? context.l10n.editStructureAddAppBarTitle
                : state.initialStructure!.title,
          );
        },
      ),
      actions: [
        BlocBuilder<EditStructureBloc, EditStructureState>(
          buildWhen: (previous, current) =>
              previous.deletionStatus != current.deletionStatus,
          builder: (context, state) {
            if (state.isNewStructure) {
              return const SizedBox.shrink();
            }

            final bloc = context.read<EditStructureBloc>();
            final isLoading = state.deletionStatus.isLoading;

            return IconButton(
              onPressed: isLoading
                  ? null
                  : () => bloc.add(const EditStructureEvent.structureDeleted()),
              icon: isLoading
                  ? LoadingIndicator.tiny()
                  : const Icon(Icons.delete_outline),
            );
          },
        ),
      ],
    );
  }
}
