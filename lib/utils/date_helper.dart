import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(String date) {
    try {
      final dateTime = DateTime.parse(date).toLocal();
      final formatter = DateFormat('dd MMM yyyy');
      return formatter.format(dateTime);
    } catch (e) {
      return '-';
    }
  }
}
