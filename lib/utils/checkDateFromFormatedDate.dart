
import 'package:mymoney/utils/allFormatter.dart';

String checkDateFromFormatedDate(String dateString) {
  //  example, dateString = "2020-01-26";

  DateTime checkedTime = DateTime(
      int.parse(dateString.split("-").last),
      int.parse(dateString.split("-")[1]),
      int.parse(dateString.split("-").first));
  DateTime currentTime = DateTime.now();

  if ((currentTime.year == checkedTime.year) &&
      (currentTime.month == checkedTime.month) &&
      (currentTime.day == checkedTime.day)) {
    return "TODAY";
  } else if ((currentTime.year == checkedTime.year) &&
      (currentTime.month == checkedTime.month)) {
    if ((currentTime.day - checkedTime.day) == 1) {
      return "YESTERDAY";
    } else if ((currentTime.day - checkedTime.day) == -1) {
      return "TOMORROW";
    } else {
      return dateString.split("-").first +
          " " +
          month[int.parse(dateString.split("-").first[1]) + 1];
    }
  } else {
    return dateString.split("-").first +
        " " +
        month[int.parse(dateString.split("-").first[1]) + 1];
  }
}
