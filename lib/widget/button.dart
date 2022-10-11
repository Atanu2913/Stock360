import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/utils/color.dart';

button(BuildContext context,
    {String text,
    Color color = appColor,
    Color textColor = Colors.white,
    Function() function,
    bool enable = true}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          // color: enable? Colors.blue.withOpacity(0.3):AllColor.greyColor.withOpacity(0.3),
          color: appGreen.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 1),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 19.37,
      minWidth: Get.width / 2.057,
      onPressed: enable ? function : () {},
      color: appGreen,
      // color: enable ? color ?? appColor : AllColor.greyColor,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),
  );
}
