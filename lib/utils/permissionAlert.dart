
//*****************
//
// permission alertBox for whole application
//
//*****************
import 'package:get/get.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/allTextStyle.dart';
import 'package:mymoney/widget/button.dart';
import 'package:permission_handler/permission_handler.dart';

permissionAlert(BuildContext context, Permission permission) {
  return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              content: Container(
                height: Get.width * 0.5,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100]),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      height: Get.width * 0.2,
                      width: Get.width,
                      child: Center(
                        child: Icon(
                          permission.toString() == "Permission.camera"
                              ? Icons.camera_alt
                              : permission.toString() == "Permission.storage"
                                  ? Icons.storage
                                  : permission.toString() ==
                                          "Permission.location"
                                      ? Icons.location_on_sharp
                                      : Icons.mic,
                          color: AllColor.white,
                          size: Get.width * 0.15,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.08,
                        vertical: Get.width * 0.02,
                      ),
                      child: Text(
                        permission.toString() == "Permission.camera"
                            ? "To capture videos allow Protomax access to your camera"
                            : permission.toString() == "Permission.storage"
                                ? "Allow Protomax access to your device's photos, media and files to continue"
                                : permission.toString() == "Permission.location"
                                    ? "To get your current location allow Protomax access to your location"
                                    : "To record voice, allow Protomax access to your location",
                        style: normalTextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: button(
                            context,
                            function: () => Navigator.pop(context, false),
                            text: AllString.notNow,
                          ),
                          width: Get.width * 0.28,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          width: Get.width * 0.28,
                          child: button(context,
                              function: () => Navigator.pop(context, true),
                              text: AllString.continuee,
                          )
                        )
                      ],
                    )
                  ],
                ),
              )),
        );
      });
}
