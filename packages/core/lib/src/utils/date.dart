// lib/src/utils/date.dart
import 'package:intl/intl.dart';

class BeDateUtils {
  static String formatDate(final DateTime date, {final String format = 'yyyy-MM-dd'}) => DateFormat(format).format(date);

  static DateTime? parseDate(final String dateString, {final String format = 'yyyy-MM-dd'}) => DateFormat(format).parse(dateString);

  static String timeAgo(final DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
