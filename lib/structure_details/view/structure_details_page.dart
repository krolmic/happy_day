import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/structure_details/structure_details.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

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
      ),
      child: StructureDetailsView(
        structure: structure,
      ),
    );
  }
}

class StructureDetailsView extends StatelessWidget {
  const StructureDetailsView({
    required this.structure,
    super.key,
  });

  final Structure structure;

  @override
  Widget build(BuildContext context) {
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
      ],
      child: Scaffold(
        appBar: buildAppBar(),
        floatingActionButton: buildFloatingActionButton(context),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              if (structure.description != null)
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      structure.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text(structure.title),
      actions: [
        BlocBuilder<StructureDetailsCubit, StructureDetailsState>(
          buildWhen: (previous, current) =>
              previous.structureOfADay != current.structureOfADay,
          builder: (context, state) {
            return !state.isStructureStarted
                ? IconButton(
                    onPressed:
                        context.read<StructureDetailsCubit>().startStructure,
                    icon: const Icon(Icons.add),
                  )
                : IconButton(
                    onPressed:
                        context.read<StructureDetailsCubit>().resetStructure,
                    icon: const Icon(Icons.remove),
                  );
          },
        ),
      ],
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {
        context.pushNamed(RoutesNames.editStructure, extra: structure);
      },
      child: const Icon(Icons.edit),
    );
  }
}
