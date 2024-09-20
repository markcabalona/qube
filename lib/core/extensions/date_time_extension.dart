import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString([String format = 'MMMM dd, yyyy - hh:mm aa']) {
    return DateFormat(format).format(this);
  }

  bool isSameDayWith(DateTime other) =>
      month == other.month && day == other.day && year == other.year;
}
