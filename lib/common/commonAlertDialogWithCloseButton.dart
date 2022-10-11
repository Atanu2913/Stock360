import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/allIcon.dart';
import 'package:mymoney/utils/allTextStyle.dart';
commonAlertDialogWithCloseButton(
  BuildContext context,
  String title,
  message,
) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 18.0,
                      ),
                      margin: EdgeInsets.only(top: 13.0, right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: AllColor.white,
                            margin: EdgeInsets.symmetric(
                              vertical: Get.width * 0.02,
                              horizontal: Get.width * 0.02,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: normalTextStyle(
                                  color: title == AllString.error
                                      ? AllColor.red
                                      : title == AllString.warning
                                          ? AllColor.yellow
                                          : title == AllString.success
                                              ? AllColor.green
                                              : AllColor.black
                                                  .withOpacity(0.7)),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            alignment: Alignment.center,
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: normalTextStyle(
                                  color: AllColor.black.withOpacity(0.7)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                              radius: 14.0,
                              backgroundColor: Colors.white,
                              child: normalIcon(Icons.close,
                                  color: AllColor.greyColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
