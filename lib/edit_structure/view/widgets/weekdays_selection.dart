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
    required this.onChange,
    this.values = const [
      true,
      true,
      true,
      true,
      true,
      false,
      false,
    ],
    this.weekdaysLabels = const [
      'Mo',
      'Tu',
      'We',
      'Th',
      'Fr',
      'Sa',
      'Su',
    ],
    this.selectedDecoration = const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.unselectedDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.selectedTextStyle = const TextStyle(color: Colors.white),
    this.unselectedTextStyle = const TextStyle(color: Colors.blue),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    super.key,
  });

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
