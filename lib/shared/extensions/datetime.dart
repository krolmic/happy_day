extension DateTimeX on DateTime {
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
