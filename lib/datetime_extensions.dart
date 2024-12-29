import 'package:flutter/material.dart';

extension DateTimeExtensions on DateTime {
  /// Checks if the current date is today
  bool get isToday => isSameDate(DateTime.now());

  /// Checks if the current date is yesterday
  bool get isYesterday => isSameDate(DateTime.now().subtract(Duration(days: 1)));

  /// Checks if the current date is tomorrow
  bool get isTomorrow => isSameDate(DateTime.now().add(Duration(days: 1)));

  /// Checks if the current date is in the past
  bool get isInPast => isBefore(DateTime.now());

  /// Checks if the current date is in the future
  bool get isInFuture => isAfter(DateTime.now());

  /// Checks if the current hour is even
  bool get isEvenHour => hour % 2 == 0;

  /// Checks if the current hour is odd
  bool get isOddHour => hour % 2 != 0;

  /// Checks if the current minute is even
  bool get isEvenMinute => minute % 2 == 0;

  /// Checks if the current minute is odd
  bool get isOddMinute => minute % 2 != 0;

  /// Checks if the date is a weekend
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Returns the start of the day for the DateTime
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns the end of the day for the DateTime
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Checks if the current date is in the same week as [other]
  bool isSameWeek(DateTime other) {
    final weekStart = subtract(Duration(days: weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    return other.isAfter(weekStart) && other.isBefore(weekEnd);
  }

  /// Checks if the current date is in the same month as [other]
  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  /// Checks if the current date is in the same year as [other]
  bool isSameYear(DateTime other) => year == other.year;

  /// Checks if the current date is on the same day as [other]
  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  /// Checks if the current date falls within a range of [start] and [end]
  bool isWithinRange(DateTime start, DateTime end) =>
      isAfter(start) && isBefore(end) || isSameDate(start) || isSameDate(end);

  /// Checks if the current time is within a time range (ignores date)
  bool isTimeWithinRange(TimeOfDay start, TimeOfDay end) {
    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    if (startMinutes <= endMinutes) {
      return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
    } else {
      // Handles ranges that span midnight (e.g., 10:00 PM to 2:00 AM)
      return currentMinutes >= startMinutes || currentMinutes <= endMinutes;
    }
  }

  /// Checks if the current time is within the next N minutes
  bool isWithinNextMinutes(int minutes) {
    final now = DateTime.now();
    final futureTime = now.add(Duration(minutes: minutes));
    return isAfter(now) && isBefore(futureTime);
  }

  /// Checks if the current time is within the past N minutes
  bool isWithinPastMinutes(int minutes) {
    final now = DateTime.now();
    final pastTime = now.subtract(Duration(minutes: minutes));
    return isBefore(now) && isAfter(pastTime);
  }

  /// Checks if the current time is within the next N hours
  bool isWithinNextHours(int hours) {
    final now = DateTime.now();
    final futureTime = now.add(Duration(hours: hours));
    return isAfter(now) && isBefore(futureTime);
  }

  /// Checks if the current time is within the past N hours
  bool isWithinPastHours(int hours) {
    final now = DateTime.now();
    final pastTime = now.subtract(Duration(hours: hours));
    return isBefore(now) && isAfter(pastTime);
  }



  /// Adds a specified number of minutes to the current DateTime
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));

  /// Subtracts a specified number of minutes from the current DateTime
  DateTime subtractMinutes(int minutes) => subtract(Duration(minutes: minutes));

  /// Adds a specified number of hours to the current DateTime
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// Subtracts a specified number of hours from the current DateTime
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));


  String format({String pattern = 'dd-MM-yyyy'}) {
    final daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final monthsOfYear = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final isPM = hour >= 12;
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    final replacements = {
      "yyyy": year.toString(),
      "yy": year.toString().substring(2),
      "MMMM": monthsOfYear[month - 1],
      "MMM": monthsOfYear[month - 1].substring(0, 3),
      "MM": month.toString().padLeft(2, '0'),
      "M": month.toString(),
      "dd": day.toString().padLeft(2, '0'),
      "d": day.toString(),
      "EEEE": daysOfWeek[weekday - 1],
      "EEE": daysOfWeek[weekday - 1].substring(0, 3),
      "HH": hour.toString().padLeft(2, '0'),
      "H": hour.toString(),
      "hh": hour12.toString().padLeft(2, '0'),
      "h": hour12.toString(),
      "mm": minute.toString().padLeft(2, '0'),
      "m": minute.toString(),
      "ss": second.toString().padLeft(2, '0'),
      "s": second.toString(),
      "SSS": millisecond.toString().padLeft(3, '0'),
      "a": isPM ? "PM" : "AM",
      "Z": timeZoneOffset(),
      "z": timeZoneName,
      "Q": ((month - 1) ~/ 3 + 1).toString(),
      "DD": dayOfYear().toString().padLeft(3, '0'),
      "D": dayOfYear().toString(),
      "ww": weekOfYear().toString().padLeft(2, '0'),
      "w": weekOfYear().toString(),
      "u": weekday.toString(),
    };

    var formatted = pattern;
    replacements.forEach((key, value) {
      formatted = formatted.replaceAll(key, value);
    });

    return formatted;
  }
  String formatTime({String pattern = 'HH:mm:ss'}) {
    return format(pattern: pattern);
  }



  // Helper method to calculate the day of the year
  int dayOfYear() {
    final startOfYear = DateTime(year, 1, 1);
    return difference(startOfYear).inDays + 1;
  }

  // Helper method to calculate the week of the year
  int weekOfYear() {
    final startOfYear = DateTime(year, 1, 1);
    final daysSinceStart = difference(startOfYear).inDays;
    return (daysSinceStart / 7).ceil();
  }

  // Helper to format timezone offset
  String timeZoneOffset() {
    final offset = this.timeZoneOffset;
    final hours = offset.inHours.toString().padLeft(2, '0');
    final minutes = (offset.inMinutes % 60).toString().padLeft(2, '0');
    return "${offset.isNegative ? '-' : '+'}$hours:$minutes";
  }
}




extension NullableExtension<T> on T? {
  T orDefault(T defaultValue) => this ?? defaultValue;
}