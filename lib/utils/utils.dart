import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Color primaryColor = Color(0xFF029247);

final TextStyle overlayStyle = TextStyle(letterSpacing: 1.25);

final TextStyle currentDayStyle = TextStyle(
  letterSpacing: 0.25,
  color: Colors.red,
  fontSize: 14,
);

final TextStyle todoStyle = TextStyle(
  letterSpacing: 0.25,
  color: Colors.orange,
  fontSize: 14,
);

final TextStyle doneStyle = TextStyle(
  letterSpacing: 0.25,
  color: Colors.green,
  fontSize: 14,
);

final Color incommingAmount = Color(0xFF029247);
final Color outgoingAmount = Color(0xFFFF3D00);

String formattedDateTime(String rawDate) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var date1 = inputFormat.parse(rawDate);
  var outputFormat = DateFormat('dd MMM yy, HH:mm');
  return outputFormat.format(date1);
}

String formattedDateTimeForTasks(String rawDate) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var date1 = inputFormat.parse(rawDate);
  var outputFormat = DateFormat('dd MMM yy');
  return outputFormat.format(date1);
}

String formattedDateTimeForTaskUpload(DateTime rawDate) {
  var outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(rawDate);
}

String formattedDateTimeForMeetingUpload(DateTime rawDate) {
  var outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  return outputFormat.format(rawDate);
}

double calculateEOTB(double capitalAmount, int months) {
  if (months == 1) {
    double tenured = capitalAmount + (capitalAmount * 0.12);
    return tenured;
  } else {
    double tenured = capitalAmount;
    for (int i = 0; i < months - 1; i++) {
      tenured = tenured + ((capitalAmount) * 0.12);
      capitalAmount = tenured;
    }
    return tenured;
  }
}
