import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';






const String admin = "admin";
const String coach = "coach";
const String adherant = "adherent";
const String agent = "agent";

DateTime now = DateTime.now();

List<String> weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
List<String> months = [
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
String dayOfWeek = weekdays[now.weekday - 1];
String dayOfMonth = now.day.toString();
String month = months[now.month - 1];
String year = now.year.toString();

String formatDateString(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);

  DateFormat formatter = DateFormat('dd-MM-yyyy');

  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
