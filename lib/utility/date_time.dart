class Age {
  final int years;
  final int months;
  final int days;

  Age({
    required this.years,
    required this.months,
    required this.days,
  });
}

class DateTimeUtil {
  static Age calculateAge(DateTime dob) {
    final today = DateTime.now();

    final years = today.year - dob.year;
    final months = today.month - dob.month;
    final days = today.day - dob.day;

    return Age(
      years: years,
      months: months,
      days: days,
    );
  }

  static String processAssessmentYear(String str) {
    final parts = str.split('-');
    if (parts.length == 2 && parts[0].length == 4 && parts[1].length == 4) {
      final left = parts[0];
      final right = parts[1].substring(2);
      return '$left-$right';
    } else if (str.length == 6) {
      final left = str.substring(0, 4);
      final right = str.substring(4);
      return '$left-$right';
    } else {
      return str;
    }
  }
}
