String formatDurationFromMilliseconds(int milliseconds) {
  // Convert milliseconds to seconds
  int totalSeconds = milliseconds ~/ 1000;

  // Calculate the number of days, hours, and minutes
  int days = totalSeconds ~/ (24 * 60 * 60);
  int hours = (totalSeconds % (24 * 60 * 60)) ~/ (60 * 60);
  int minutes = (totalSeconds % (60 * 60)) ~/ 60;

  // Format the duration in 'dd:hh:mm' format
  return '${days.toString().padLeft(2, '0')}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

String formatDurationFromSeconds(int seconds) {
  // Calculate the number of days, hours, and minutes
  int days = seconds ~/ (24 * 60 * 60);
  int hours = (seconds % (24 * 60 * 60)) ~/ (60 * 60);
  int minutes = (seconds % (60 * 60)) ~/ 60;

  // Format the duration in 'dd:hh:mm' format
  return '${days.toString()}d ${hours.toString()}h ${minutes.toString()}m';
}
