import 'package:f_logs/f_logs.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  //DateTime Methods:-----------------------------------------------------------
  static int getCurrentTimeInMillis() => DateTime.now().millisecondsSinceEpoch;

  static String getCurrentTime(LogConfig config) {
    if (config.timestampFormat.isEmpty) {
      return DateTime.now().toString();
    } else {
      return DateFormat(config.timestampFormat).format(DateTime.now());
    }
  }

  static int getStartAndEndTimestamps({required FilterType type}) {
    final getSubtractedDateTime = (int sub) => DateTime.now().subtract(Duration(hours: sub));
    final getTodayDateTime = () => getSubtractedDateTime(DateTime.now().hour);

    switch (type) {
      case FilterType.LAST_HOUR:
        return getSubtractedDateTime(1).millisecondsSinceEpoch;
      case FilterType.LAST_24_HOURS:
        return getSubtractedDateTime(24).millisecondsSinceEpoch;
      case FilterType.TODAY:
        return getTodayDateTime().millisecondsSinceEpoch;
      case FilterType.WEEK:
        return getTodayDateTime().subtract(Duration(days: 7)).millisecondsSinceEpoch;
      case FilterType.ALL:
        return DateTime(2000, 1, 1).millisecondsSinceEpoch;
    }
  }
}
