import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/extensions/structure.dart';
import 'package:happy_day/shared/router/router.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/sliver_delegate.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

part 'widgets/daily_structure.dart';
part 'widgets/daily_structures.dart';

class DailyStructuresPage extends StatelessWidget {
  const DailyStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DailyStructuresCubit(
        structuresRepository: context.read<StructuresRepository>(),
        structureAvailabilityService: const StructureAvailabilityService(),
      )..init(),
      child: const DailyStructuresView(),
    );
  }
}

class DailyStructuresView extends StatelessWidget {
  const DailyStructuresView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DailyStructuresCubit, DailyStructuresState>(
          listenWhen: (previous, current) =>
              previous.structuresStatus != current.structuresStatus ||
              previous.structuresOfADayStatus != current.structuresOfADayStatus,
          listener: (context, state) {
            if (state.isFailure) {
              showErrorToastification(title: context.l10n.errorMessage);
            }
          },
        ),
        BlocListener<DailyStructuresCubit, DailyStructuresState>(
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
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => context.pushNamed(RoutesNames.settings),
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: const SafeArea(
          child: DailyStructuresContent(),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () => context.pushNamed(RoutesNames.editStructure),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class DailyStructuresContent extends StatelessWidget {
  const DailyStructuresContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DailyStructuresCubit>();

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverDelegate(
            minHeight: 180,
            maxHeight: 180,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surface,
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                disabledDates: () {
                  final now = DateTime.now();
                  final endOfYear = DateTime(now.year, 12, 31);
                  final daysUntilEndOfYear = endOfYear.difference(now).inDays;

                  return List.generate(
                    daysUntilEndOfYear,
                    (index) => now.add(Duration(days: index + 1)),
                  );
                }(),
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
                ),
                dayProps: EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: HappyDayTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  todayHighlightColor: HappyDayTheme.primaryColor,
                ),
                onDateChange: context.read<DailyStructuresCubit>().setDate,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: BlocBuilder<DailyStructuresCubit, DailyStructuresState>(
            buildWhen: (previous, current) =>
                previous.date != current.date ||
                previous.structuresOfADay != current.structuresOfADay ||
                previous.structures != current.structures ||
                previous.structuresStatus != current.structuresStatus ||
                previous.structuresOfADayStatus !=
                    current.structuresOfADayStatus,
            builder: (context, state) {
              return DailyStructures(
                isLoading: state.isInitialOrLoading,
                structures: cubit.getSortedStructures(),
                structuresOfADay: state.structuresOfADay,
              );
            },
          ),
        ),
      ],
    );
  }
}
