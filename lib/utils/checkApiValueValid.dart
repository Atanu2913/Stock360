import 'package:mymoney/res/allString.dart';

bool checkApiValueValid(dynamic value) {
  if (value == null ||
      value.toString().toLowerCase() == "null" ||
      value.toString().toLowerCase() == "") {
    return true;
  } else {
    return false;
  }
}
bool validValue(dynamic value) {
  if (value == null ||
      value.toString().toLowerCase() == "null" ||
      value.toString().toLowerCase() == "") {
    return false;
  } else {
    return true;
  }
}
String showValidValue(dynamic value){
  return validValue(value)?value.toString():AllString.na;
}