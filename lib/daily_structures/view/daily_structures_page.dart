import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:happy_day/shared/widgets/sliver_delegate.dart';

part 'widgets/structure.dart';
part 'widgets/structures.dart';

class DailyStructuresPage extends StatelessWidget {
  const DailyStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DailyStructuresCubit(),
      child: const DailyStructuresView(),
    );
  }
}

class DailyStructuresView extends StatelessWidget {
  const DailyStructuresView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Scaffold(
      // appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const SafeArea(child: DailyStructuresContent()),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () => context.read<DailyStructuresCubit>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DailyStructuresContent extends StatelessWidget {
  const DailyStructuresContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
                ),
                dayProps: const EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                ),
                onDateChange: (selectedDate) {},
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          sliver: Structures(),
        ),
      ],
    );
  }
}

// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final count = context.select((DailyStructuresCubit cubit) => cubit.state);
//     return Text('$count', style: theme.textTheme.displayLarge);
//   }
// }
