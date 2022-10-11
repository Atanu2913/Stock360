import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/allMargin.dart';
import 'package:mymoney/utils/allTextStyle.dart';
import 'package:mymoney/widget/button.dart';

commonAlertDialog(BuildContext context, String title, message,
    {Function() function}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 0.0,
                backgroundColor: AllColor.white,
                title: Container(
                  color: AllColor.white,
                  margin: EdgeInsets.symmetric(
                    vertical: Get.width * 0.02,
                    horizontal: Get.width * 0.02,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: headingTextStyle(
                        fontWeight: FontWeight.bold,
                        color: title.toLowerCase() == "error" ||
                                title.toLowerCase() == "failure"
                            ? AllColor.red
                            : title == AllString.warning
                                ? AllColor.yellow
                                : AllColor.green),
                  ),
                ),
                children: [
                  Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: AllMargin.customMarginCardItem(),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: headingTextStyle(
                          color: AllColor.black.withOpacity(0.7)),
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: button(context,
                            text: AllString.ok,
                            function: function == null
                                ? () {
                                    Navigator.pop(context);
                                  }
                                : function),
                      ),
                    ],
                  )
                ]),
          ));
}
