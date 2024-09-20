import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString([String format = 'MMMM dd, yyyy - hh:mm aa']) {
    return DateFormat(format).format(this);
  }
}
