import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:happy_day/edit_structure/edit_structure.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/layout.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/app_dots_indicator.dart';
import 'package:happy_day/shared/widgets/loading_indicator.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:toastification/toastification.dart';

part 'widgets/color_selection.dart';
part 'widgets/description_field.dart';
part 'widgets/label.dart';
part 'widgets/preview.dart';
part 'widgets/stepper.dart';
part 'widgets/title_field.dart';

class EditStructurePage extends StatelessWidget {
  const EditStructurePage({required this.initialStructure, super.key});

  final Structure? initialStructure;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditStructureBloc(
        structuresRepository: context.read<StructuresRepository>(),
        initialStructure: initialStructure,
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
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isSuccess) {
              showSuccessToastification(
                title: isNewStructure
                    ? l10n.editStructureAddSuccessMessage
                    : l10n.editStructureUpdateSuccessMessage,
              );

              context.pop();
            } else if (state.status.isFailure) {
              showErrorToastification(
                title: l10n.errorMessage,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Stepper(
            pages: [
              StepperPage(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleField(),
                    const SizedBox(
                      height: 30,
                    ),
                    const DescriptionField(),
                    const SizedBox(
                      height: 30,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Label(text: l10n.editStructurePreviewLabel),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Preview(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const ColorSelection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const StepperPage(
                child: Text('steps'),
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
    );
  }
}
