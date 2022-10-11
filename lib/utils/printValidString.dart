import 'package:mymoney/res/allString.dart';

String printValidString(dynamic value) {
  if (value == null ||
      value.toString().toLowerCase() == "null" ||
      value.toString().toLowerCase() == "") {
    return AllString.na;
  } else {
    return value.toString();
  }
}
