class DateFormatter{

  static String getDateInYMD(DateTime date){
    // Formatting the date in ISO8601 standards with just the year-month-day
    // Making sure to pad the month and day if only one digit
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
  static String getTimeInHM(DateTime date){
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}