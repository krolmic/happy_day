import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/cubit/daily_structures_cubit.dart';
import 'package:happy_day/shared/router/router.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/theme/theme.dart';

class ExpandableFloatingActionButton extends StatelessWidget {
  const ExpandableFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: const ValueKey('expandable-fab'),
      distance: 72,
      fanAngle: 70,
      type: ExpandableFabType.up,
      overlayStyle: const ExpandableFabOverlayStyle(
        blur: 4,
      ),
      openButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: HappyDayTheme.primaryColor,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Colors.white,
        backgroundColor: HappyDayTheme.primaryColor,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton(
          heroTag: 'weekday-fab',
          shape: const CircleBorder(),
          elevation: 0,
          backgroundColor: HappyDayTheme.primaryColor,
          onPressed: () => context.pushNamed(RoutesNames.editStructure),
          child: const Icon(Icons.calendar_view_week),
        ),
        FloatingActionButton(
          heroTag: 'calendar-day-fab',
          shape: const CircleBorder(),
          elevation: 0,
          backgroundColor: HappyDayTheme.primaryColor,
          onPressed: () {
            final selectedDay = context.read<DailyStructuresCubit>().state.date;
            final parameters = EditCalendarStructureRouteParameters(
              selectedDay: selectedDay,
            );
            context.pushNamed(
              RoutesNames.editCalendarStructure,
              extra: parameters,
            );
          },
          child: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}
