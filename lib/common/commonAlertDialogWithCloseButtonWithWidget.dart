import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/utils/allIcon.dart';

commonAlertDialogWithCloseButtonWithWidget(
    BuildContext context, Color color, Widget widget,
    {Function() onCloseButtonPress}) {
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
                        top: 0,
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
                          widget,
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: onCloseButtonPress ??
                            () {
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
