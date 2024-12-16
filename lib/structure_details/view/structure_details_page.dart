import 'package:confetti/confetti.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/extensions/structure.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/structure_details/structure_details.dart';
import 'package:intl/intl.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'widgets/header.dart';
part 'widgets/steps.dart';

class StructureDetailsPage extends StatelessWidget {
  const StructureDetailsPage({
    required this.structure,
    required this.date,
    this.structureOfADay,
    super.key,
  });

  final Structure structure;
  final DateTime date;
  final StructureOfADay? structureOfADay;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StructureDetailsCubit(
        structuresRepository: context.read<StructuresRepository>(),
        structure: structure,
        date: date,
        structureOfADay: structureOfADay,
      )..init(),
      child: StructureDetailsView(
        structure: structure,
        date: date,
      ),
    );
  }
}

class StructureDetailsView extends StatefulWidget {
  const StructureDetailsView({
    required this.structure,
    required this.date,
    super.key,
  });

  final Structure structure;
  final DateTime date;

  @override
  State<StructureDetailsView> createState() => _StructureDetailsViewState();
}

class _StructureDetailsViewState extends State<StructureDetailsView> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Path drawCircleConfetti(Size size) {
    final radius = size.width / 3;
    final path = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(radius, radius),
          radius: radius,
        ),
      );
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.structure.color;
    final theme = Theme.of(context);
    final surfaceColor = theme.colorScheme.surface;

    return MultiBlocListener(
      listeners: [
        BlocListener<StructureDetailsCubit, StructureDetailsState>(
          listenWhen: (previous, current) =>
              previous.startStructureStatus != current.startStructureStatus,
          listener: (context, state) {
            if (state.startStructureStatus.isFailure) {
              showErrorToastification(title: context.l10n.errorMessage);
            }
          },
        ),
        BlocListener<StructureDetailsCubit, StructureDetailsState>(
          listenWhen: (previous, current) =>
              previous.structureOfADay != current.structureOfADay,
          listener: (context, state) {
            if (state.structureOfADay?.isCompleted ?? false) {
              _confettiController.play();
              showSuccessToastification(
                title: context.l10n.structureCompletedMessage,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(),
        floatingActionButton: buildFloatingActionButton(context),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Header(
                    structure: widget.structure,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverFillRemaining(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  surfaceColor,
                                  surfaceColor,
                                  surfaceColor,
                                  surfaceColor.withValues(alpha: 0),
                                ],
                                stops: const [0.0, 0.85, 0.95, 1.0],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Steps(color: color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  createParticlePath: drawCircleConfetti,
                  blastDirection: 0,
                  emissionFrequency: 0.5,
                  colors: [
                    color.withValues(alpha: 0.1),
                    color.withValues(alpha: 0.25),
                    color.withValues(alpha: 0.5),
                    color.withValues(alpha: 0.75),
                    color,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    final l10n = context.l10n;
    final cubit = context.read<StructureDetailsCubit>();

    return AppBar(
      centerTitle: true,
      title: Text(
        DateFormat(
          const DateFormatter.fullDateDMonthAsStrY().format(),
        ).format(widget.date),
      ),
      actions: [
        BlocBuilder<StructureDetailsCubit, StructureDetailsState>(
          buildWhen: (previous, current) =>
              previous.structureOfADay != current.structureOfADay,
          builder: (context, state) {
            return PopupMenuButton<String>(
              color: Theme.of(context).colorScheme.surface,
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 'toggle':
                    !state.isStructureStarted
                        ? cubit.startStructure()
                        : cubit.resetStructure();
                  case 'edit':
                    context.pushNamed(
                      RoutesNames.editStructure,
                      extra: widget.structure,
                    );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'toggle',
                  child: Row(
                    children: [
                      Icon(
                        !state.isStructureStarted ? Icons.add : Icons.remove,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        !state.isStructureStarted
                            ? l10n.startStructure
                            : l10n.resetStructure,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      const Icon(Icons.edit, size: 20),
                      const SizedBox(width: 8),
                      Text(l10n.editStructure),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<StructureDetailsCubit, StructureDetailsState>(
      buildWhen: (previous, current) =>
          previous.activeStepIndex != current.activeStepIndex ||
          previous.structureOfADay != current.structureOfADay,
      builder: (context, state) {
        final cubit = context.read<StructureDetailsCubit>();

        final isBuild = !(state.isLastStep && state.isCurrentStepCompleted);

        return AnimatedOpacity(
          opacity: isBuild ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton(
            backgroundColor: widget.structure.color,
            elevation: 0,
            onPressed: () {
              if (!state.isCurrentStepCompleted) {
                cubit.completeStep(state.steps[state.activeStepIndex].id);
              }
              cubit.setActiveStepIndex(state.activeStepIndex + 1);
            },
            child: const Icon(Icons.check),
          ),
        );
      },
    );
  }
}
