part of '../edit_structure_page.dart';

class WeekdaysSelection extends StatelessWidget {
  const WeekdaysSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.select(
      (EditStructureBloc bloc) => bloc.state.color,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          text: l10n.weekDays,
          color: color,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<EditStructureBloc, EditStructureState>(
          buildWhen: (previous, current) =>
              previous.weekDays != current.weekDays,
          builder: (context, state) {
            return WeekdaysSelectionDays(
              color: color,
              values: state.weekDays,
              weekdaysLabels: [
                l10n.mondayShort,
                l10n.tuesdayShort,
                l10n.wednesdayShort,
                l10n.thursdayShort,
                l10n.fridayShort,
                l10n.saturdayShort,
                l10n.sundayShort,
              ],
              onChange: (index) {
                context.read<EditStructureBloc>().add(
                      EditStructureEvent.weekDayTriggered(index),
                    );
              },
              selectedDecoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              unselectedDecoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.white,
              ),
              unselectedTextStyle: TextStyle(
                color: color,
              ),
            );
          },
        ),
      ],
    );
  }
}

class WeekdaysSelectionDays extends StatelessWidget {
  const WeekdaysSelectionDays({
    required this.color,
    required this.values,
    required this.weekdaysLabels,
    required this.onChange,
    required this.selectedDecoration,
    required this.unselectedDecoration,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    super.key,
  });

  final Color color;
  final List<bool> values;
  final List<String> weekdaysLabels;
  final void Function(int) onChange;
  final BoxDecoration selectedDecoration;
  final BoxDecoration unselectedDecoration;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) {
          final weekdayIsSelected = values[index];

          return Material(
            key: Key('weekday-$index'),
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onChange(index),
              borderRadius: borderRadius,
              child: Container(
                width: 40,
                height: 40,
                decoration: weekdayIsSelected
                    ? selectedDecoration
                    : unselectedDecoration,
                child: Center(
                  child: Text(
                    weekdaysLabels[index],
                    style: weekdayIsSelected
                        ? selectedTextStyle
                        : unselectedTextStyle,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
