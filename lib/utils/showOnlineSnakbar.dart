
import 'package:mymoney/res/allColor.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/allText.dart';

showOnlineSnakbar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AllColor.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      )),
      content: normalText(AllString.backToInternet),
      duration: Duration(seconds: 1),
    ),
  );
}