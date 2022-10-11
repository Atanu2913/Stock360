import 'package:mymoney/res/allString.dart';
import 'package:intl/intl.dart';

List<String> specialNumberFormat =
    //    0     1     2     3     4     5     6     7     8     9
    [
  "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th",
  //    10    11    12    13    14    15    16    17    18    19
  "th", "th", "th", "th", "th", "th", "th", "th", "th", "th",
  //    20    21    22    23    24    25    26    27    28    29
  "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th",
  //    30    31
  "th", "st"
];

List<int> totalDayInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

dateFormatForMonthAndDay(DateTime dateTime) {
  return dateTime.day.toString() +
      "" +
      specialNumberFormat[dateTime.day].toString() +
      " " +
      month[dateTime.month - 1].toString() +
      ", " +
      dateTime.year.toString();
}

final currencyFormat = NumberFormat.currency(locale: 'HI');

List<int> twentyFourFormat = [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0];
NumberFormat numberFormatter = new NumberFormat("00");
final String splitText = "==+RB+==";
final String rBAuthKey = "RBDWAh!Q1s74e";
final String apiDefaultUserId = "PRB0329869";
final DateFormat formatter = DateFormat('dd-MM-yyyy');
final DateFormat formatterYY = DateFormat('yyyy-MM-dd');
final DateFormat onlyTimeFormatter = DateFormat('kk:mm a');
final DateFormat fullTimeFormatter = DateFormat('h:mm:ss a');
final DateFormat onlyTimeFormatter12HRS =
    DateFormat('h:mm a'); //DateFormat.jm().format(DateTime.now())

String formatCurrency(dynamic amount) {
  return currencyFormat.format(amount).toString().split("INR").last.toString()
      // .split(".")
      // .first
      // .toString()
      ;
}

List month = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
List weekDay = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];
List timeIntervalList = [
  "12:00 AM",
  "12:30 AM",
  "01:00 AM",
  "01:30 AM",
  "02:00 AM",
  "02:30 AM",
  "03:00 AM",
  "03:30 AM",
  "04:00 AM",
  "04:30 AM",
  "05:00 AM",
  "05:30 AM",
  "06:00 AM",
  "06:10 AM",
  "06:20 AM",
  "06:30 AM",
  "06:40 AM",
  "06:50 AM",
  "07:00 AM",
  "07:10 AM",
  "07:20 AM",
  "07:30 AM",
  "07:40 AM",
  "07:50 AM",
  "07:60 AM",
  "08:00 AM",
  "08:10 AM",
  "08:20 AM",
  "08:30 AM",
  "08:40 AM",
  "08:50 AM",
  "09:00 AM",
  "09:10 AM",
  "09:20 AM",
  "09:30 AM",
  "09:40 AM",
  "09:50 AM",
  "10:00 AM",
  "10:10 AM",
  "10:20 AM",
  "10:30 AM",
  "10:40 AM",
  "10:50 AM",
  "11:00 AM",
  "11:10 AM",
  "11:20 AM",
  "11:30 AM",
  "11:40 AM",
  "11:50 AM",
  "12:00 PM",
  "12:10 PM",
  "12:20 PM",
  "12:30 PM",
  "12:40 PM",
  "12:50 PM",
  "01:00 PM",
  "01:10 PM",
  "01:20 PM",
  "01:30 PM",
  "01:40 PM",
  "01:50 PM",
  "02:00 PM",
  "02:10 PM",
  "02:20 PM",
  "02:30 PM",
  "02:40 PM",
  "02:50 PM",
  "03:00 PM",
  "03:10 PM",
  "03:20 PM",
  "03:30 PM",
  "03:40 PM",
  "03:50 PM",
  "04:00 PM",
  "04:10 PM",
  "04:20 PM",
  "04:30 PM",
  "04:40 PM",
  "04:50 PM",
  "05:00 PM",
  "05:10 PM",
  "05:20 PM",
  "05:30 PM",
  "05:40 PM",
  "05:50 PM",
  "06:00 PM",
  "06:10 PM",
  "06:20 PM",
  "06:30 PM",
  "06:40 PM",
  "06:50 PM",
  "07:00 PM",
  "07:10 PM",
  "07:20 PM",
  "07:30 PM",
  "07:40 PM",
  "07:50 PM",
  "08:00 PM",
  "08:10 PM",
  "08:20 PM",
  "08:30 PM",
  "08:40 PM",
  "08:50 PM",
  "09:00 PM",
  "09:10 PM",
  "09:20 PM",
  "09:30 PM",
  "09:40 PM",
  "09:50 PM",
  "10:00 PM",
  "10:10 PM",
  "10:20 PM",
  "10:30 PM",
  "10:40 PM",
  "10:50 PM",
  "11:10 PM",
  "11:20 PM",
  "11:30 PM",
  "11:40 PM",
  "11:50 PM",
];
String convertStringToDate({DateTime datetime, String dateString}) {
  DateTime date;
  if (dateString != null) {
    date = DateTime.parse(dateString);
  } else {
    date = datetime;
  }
  return date.day.toString() +
      specialNumberFormat[date.day] +
      " " +
      month[date.month - 1].toString().substring(0, 3) +
      ", " +
      date.year.toString();
}

List defaultTimeList = [
  AllString.select,
  "06:00 AM",
  "06:30 AM",
  "07:00 AM",
  "07:30 AM",
  "08:00 AM",
  "08:30 AM",
  "09:00 AM",
  "09:30 AM",
  "10:00 AM",
  "10:30 AM",
  "11:00 AM",
  "11:30 AM",
  "12:00 PM",
  "12:30 PM",
  "01:00 PM",
  "01:30 PM",
  "02:00 PM",
  "02:30 PM",
  "03:00 PM",
  "03:30 PM",
  "04:00 PM",
  "04:30 PM",
  "05:00 PM",
  "05:30 PM",
  "06:00 PM",
];
