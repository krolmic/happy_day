part of '../daily_structures_page.dart';

class DateTimeLine extends StatelessWidget {
  const DateTimeLine({
    super.key,
    this.onDateChange,
  });

  final void Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    final colors = context.dateTimeLineColors;

    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      headerProps: EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: const DateFormatter.fullDateDMonthAsStrY(),
        selectedDateStyle: TextStyle(
          color: colors.selectedDateColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        monthStyle: TextStyle(
          color: colors.selectedMonthColor,
          fontSize: 16,
        ),
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: colors.activeDayColor,
            borderRadius: HappyDayTheme.borderRadius,
          ),
        ),
        inactiveDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            color: colors.inactiveDayTextColor,
            fontSize: 20,
          ),
          dayStrStyle: TextStyle(
            color: colors.inactiveDayTextColor,
            fontSize: 12,
          ),
          decoration: BoxDecoration(
            color: colors.inactiveDayColor,
            borderRadius: HappyDayTheme.borderRadius,
          ),
        ),
        disabledDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            color: colors.disabledDayTextColor,
            fontSize: 20,
          ),
          dayStrStyle: TextStyle(
            color: colors.disabledDayTextColor,
            fontSize: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: HappyDayTheme.borderRadius,
          ),
        ),
        todayStyle: DayStyle(
          dayNumStyle: TextStyle(
            color: colors.todayTextColor,
            fontSize: 20,
          ),
          dayStrStyle: TextStyle(
            color: colors.todayTextColor,
            fontSize: 12,
          ),
          decoration: BoxDecoration(
            color: colors.todayColor,
            borderRadius: HappyDayTheme.borderRadius,
            border: Border.all(
              color: colors.todayBorderColor,
            ),
          ),
        ),
      ),
      onDateChange: onDateChange,
    );
  }
}

class DateTimeLineColors extends ThemeExtension<DateTimeLineColors> {
  DateTimeLineColors({
    required this.selectedDateColor,
    required this.selectedMonthColor,
    required this.inactiveDayTextColor,
    required this.inactiveDayColor,
    required this.disabledDayTextColor,
    required this.todayTextColor,
    required this.todayBorderColor,
    required this.todayColor,
  });

  DateTimeLineColors.light()
      : this(
          selectedDateColor: Colors.black,
          selectedMonthColor: Colors.black,
          inactiveDayTextColor: HappyDayTheme.primaryColor,
          inactiveDayColor: HappyDayTheme.primaryColor.withValues(alpha: 0.2),
          disabledDayTextColor: Colors.black26,
          todayTextColor: HappyDayTheme.primaryColor,
          todayBorderColor: HappyDayTheme.primaryColor,
          todayColor: HappyDayTheme.primaryColor.withValues(alpha: 0.2),
        );

  DateTimeLineColors.dark()
      : this(
          selectedDateColor: Colors.white,
          selectedMonthColor: Colors.white,
          inactiveDayTextColor: Colors.white,
          inactiveDayColor: HappyDayTheme.primaryColor.withValues(alpha: 0.2),
          disabledDayTextColor: Colors.white30,
          todayTextColor: Colors.white,
          todayBorderColor: HappyDayTheme.primaryColor,
          todayColor: HappyDayTheme.primaryColor.withValues(alpha: 0.1),
        );

  final Color selectedDateColor;
  final Color selectedMonthColor;
  final Color activeDayColor = HappyDayTheme.primaryColor;
  final Color inactiveDayTextColor;
  final Color inactiveDayColor;
  final Color disabledDayTextColor;
  final Color todayTextColor;
  final Color todayBorderColor;
  final Color todayColor;

  @override
  ThemeExtension<DateTimeLineColors> copyWith({
    Color? selectedDateColor,
    Color? selectedMonthColor,
    Color? inactiveDayTextColor,
    Color? inactiveDayColor,
    Color? disabledDayTextColor,
    Color? todayTextColor,
    Color? todayBorderColor,
    Color? todayColor,
  }) {
    return DateTimeLineColors(
      selectedDateColor: selectedDateColor ?? this.selectedDateColor,
      selectedMonthColor: selectedMonthColor ?? this.selectedMonthColor,
      inactiveDayTextColor: inactiveDayTextColor ?? this.inactiveDayTextColor,
      inactiveDayColor: inactiveDayColor ?? this.inactiveDayColor,
      disabledDayTextColor: disabledDayTextColor ?? this.disabledDayTextColor,
      todayTextColor: todayTextColor ?? this.todayTextColor,
      todayBorderColor: todayBorderColor ?? this.todayBorderColor,
      todayColor: todayColor ?? this.todayColor,
    );
  }

  @override
  ThemeExtension<DateTimeLineColors> lerp(
    ThemeExtension<DateTimeLineColors>? other,
    double t,
  ) {
    if (other is! DateTimeLineColors) return this;
    return DateTimeLineColors(
      selectedDateColor: Color.lerp(
        selectedDateColor,
        other.selectedDateColor,
        t,
      )!,
      selectedMonthColor: Color.lerp(
        selectedMonthColor,
        other.selectedMonthColor,
        t,
      )!,
      inactiveDayTextColor: Color.lerp(
        inactiveDayTextColor,
        other.inactiveDayTextColor,
        t,
      )!,
      inactiveDayColor: Color.lerp(
        inactiveDayColor,
        other.inactiveDayColor,
        t,
      )!,
      disabledDayTextColor: Color.lerp(
        disabledDayTextColor,
        other.disabledDayTextColor,
        t,
      )!,
      todayTextColor: Color.lerp(
        todayTextColor,
        other.todayTextColor,
        t,
      )!,
      todayBorderColor: Color.lerp(
        todayBorderColor,
        other.todayBorderColor,
        t,
      )!,
      todayColor: Color.lerp(
        todayColor,
        other.todayColor,
        t,
      )!,
    );
  }
}

extension HappyDayColorsExtension on BuildContext {
  DateTimeLineColors get dateTimeLineColors =>
      Theme.of(this).extension<DateTimeLineColors>()!;
}
